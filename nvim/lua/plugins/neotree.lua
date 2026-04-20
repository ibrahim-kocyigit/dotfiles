local M = {}

M.hide_by_name = {
    ".git",
    ".pytest_cache",
    ".ipynb_checkpoints"
}

M.hide_by_pattern = {
    "*.egg-info"
}

M.use_libuv_file_watcher = true

return M