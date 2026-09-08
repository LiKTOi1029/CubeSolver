local Defaults = require("defaults")
local Status = require(Defaults.Path.Status)
local Set = {}
function Set.Execute(Input)
  if Defaults.Raw.Cubes[Input[1]] then
	Status.Cube = Defaults.Raw.Cubes[Input[1]]
  else
	io.write(Defaults.Prompt.Error, "The type", Input[1], " is invalid\n")
  end
end
return Set