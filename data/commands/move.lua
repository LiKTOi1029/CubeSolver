local Move = {}
local Defaults = require("defaults")
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
local MovesetList = {}
for Index, MovesetFile in pairs(Defaults.Path.Raw.Movesets) do
  MovesetList[Index] = require(MovesetFile)
end
function Move.Execute(Input, Cube)
  Input = InputProcessor(Input)
  if type(Input) == "table" then
	local MovesetFile = MovesetList[Cube.Type].Execute
	for Index, SingularMove in ipairs(Input) do
	  Cube = MovesetFile(SingularMove, Cube)
	end
	return Cube
  end
end
return Move