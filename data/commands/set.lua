local Defaults = require("defaults")
local Status = require(Defaults.Path.Status)
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
local Set = {}
function Set.Execute(Input)
  Input = InputProcessor(Input)
  if type(Input) ~= "table" then io.write(Defaults.Prompt.Error, "Malformed input, please type help for help\n") end
  if Defaults.Path.Raw.Cubes[Input[1]] then
	Status.Cube = Defaults.Path.Raw.Cubes[Input[1]]
	Status.Type = Status.Cube[1]
	io.write(Defaults.Prompt.Output, "Cube set to ", Input[1], "\n")
  else
	io.write(Defaults.Prompt.Error, "The type", Input[1], " is invalid\n")
  end
end
return Set