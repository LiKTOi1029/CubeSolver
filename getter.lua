local Getter = {}
Getter.Commands = {}
local Defaults = require("defaults")
function Getter.Init()
  Getter.RawCommands = love.filesystem.getDirectoryItems(Defaults.Path.CommandsFolder)
  for Index, Command in ipairs(Getter.RawCommands) do
	local GSub = Command:gsub("%.%a+$", "")
	Getter.Commands[GSub:upper()] = require(Defaults.Path.CommandsFolder .. GSub)
  end
end
Getter.Init()
return Getter