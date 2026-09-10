local Move = {}
local Defaults = require("defaults")
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
local Status = require(Defaults.Path.Status)
local MovesetList = {}
for Index, MovesetFile in pairs(Defaults.Path.Raw.Movesets) do
  MovesetList[Index] = require(MovesetFile)
end
function Move.Execute(Input)
  Input = InputProcessor(Input)
  if type(Input) == "table" then
	for Index, SingularMove in ipairs(Input) do
	  MovesetList[Status.Type].Execute(SingularMove, Status.Cube)
	end
  end
end
return Move