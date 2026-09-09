local Move = {}
local Defaults = require("defaults")
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
function Move.Execute(Input)
  Input = InputProcessor(Input)
  if type(Input) == "table" then
	for Index, SingularMove in ipairs(Input) do
	  Defaults.Path.Raw.Movesets[Status.Type].Execute(SingularMove)
	end
  end
end
return Move