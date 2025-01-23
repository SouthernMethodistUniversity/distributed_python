whatis("ODSRCI Workshop: Distributed Python Using Dask and Ray")

load("gcc/11.2.0", "openmpi/4.1.6-vfi4iwj", "python/3.12.5-b22gg7o")

local script_path = myFileName()
local script_dir = dirname(script_path)
local venv_name = "dask_ray_workshop"
local venv_path = pathJoin(script_dir, venv_name)

if not isDir(venv_path) then
    LmodError("Virtual environment '" .. venv_name .. "' does not exist at: " .. venv_path)
    LmodError("Please setup the virtual environment first.")
end

source_sh("bash", pathJoin(venv_path, "bin/activate"))

help([[Name: ODSRCI Workshop: Distributed Python
Version: 2025
Website: https://southernmethodistuniversity.github.io/distributed_python/
]])

