local Getter = {}
Getter.Commands = {}
local Defaults = require("defaults")
function Getter.Init()
  Getter.RawCommands = love.filesystem.getDirectoryItems(Defaults.CommandsFolder)
  for Index, CommandFile in ipairs(AllCommandFiles) do
	local GSub = CommandFile:gsub("%.%a+$")
	Getter.Commands[GSub:upper()] = require(Defaults.CommandsFolder .. GSub)
	print(CommandFile, Index, GSub)
  end
end
Getter.Init()
return Getter