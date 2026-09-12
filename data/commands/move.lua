local Move = {}
local Defaults = require("defaults")
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
local MovesetList = {}
for Index, MovesetFile in pairs(Defaults.Path.Raw.Movesets) do
  MovesetList[Index] = require(MovesetFile)
end
function Move.Execute(Input, Cube, Type)
  Input = InputProcessor(Input)
  if type(Input) == "table" then
	local MovesetFile = MovesetList[Type].Execute
	for Index, SingularMove in ipairs(Input) do
	  Cube, Type = MovesetFile(SingularMove, Cube, Type)
	end
	return Cube, Type
  end
end
return Move