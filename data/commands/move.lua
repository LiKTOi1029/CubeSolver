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
	for Index, SingularMove in ipairs(Input) do
	  MovesetList[Status.Type].Execute(SingularMove, Cube)
	end
  end
end
return Move