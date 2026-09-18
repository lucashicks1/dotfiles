-- https://github.com/julia-vscode/LanguageServer.jl
-- Julia's language server runs *inside* julia itself: `cmd` boots julia and
-- `run()`s a LanguageServerInstance over stdio. Requires LanguageServer.jl to be
-- installed. It's loaded from a dedicated `nvim-lspconfig` env if present,
-- otherwise from the regular load path (install: `julia -e 'using Pkg; Pkg.add("LanguageServer")'`).

---@type vim.lsp.Config
return {
  cmd = {
    'julia',
    '--startup-file=no',
    '--history-file=no',
    '--depwarn=no',
    '-e',
    [[
    # Load LanguageServer.jl from a dedicated environment if it exists, with the
    # regular load path as a fallback.
    ls_install_path = joinpath(
        get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")),
        "environments", "nvim-lspconfig"
    )
    pushfirst!(LOAD_PATH, ls_install_path)
    using LanguageServer
    popfirst!(LOAD_PATH)
    depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
    project_path = let
        dirname(something(
            ## 1. Explicitly set project (JULIA_PROJECT)
            Base.load_path_expand((
                p = get(ENV, "JULIA_PROJECT", nothing);
                p === nothing ? nothing : isempty(p) ? nothing : p
            )),
            ## 2. Project.toml in cwd or a parent (up to $HOME)
            Base.current_project(),
            ## 3. First entry in the load path
            get(Base.load_path(), 1, nothing),
            ## 4. Fallback to default global environment
            Base.load_path_expand("@v#.#"),
        ))
    end
    @info "Running language server" VERSION pwd() project_path depot_path
    server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
    server.runlinter = true
    run(server)
    ]],
  },
  filetypes = { 'julia' },
  -- LanguageServer.jl only indexes files inside its workspace folder, so a loose
  -- script needs *some* root or go-to-definition/hover return nothing. Prefer a
  -- real project marker; otherwise fall back to the script's own directory.
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local root = vim.fs.root(fname, { 'Project.toml', 'JuliaProject.toml', '.git' })
    on_dir(root or vim.fs.dirname(fname))
  end,
  settings = {},
}
