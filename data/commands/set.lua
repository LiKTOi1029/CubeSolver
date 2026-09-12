local Defaults = require("defaults")
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
local CubeList = {}
for Index, CubeFile in pairs(Defaults.Path.Raw.Cubes) do
  CubeList[Index] = require(CubeFile)
end
local Set = {}
function Set.Execute(Input, Cube)
  Input = InputProcessor(Input)
  if type(Input) == "number" then io.write(Defaults.Prompt.Error, "Malformed input, please type help for help\n") return end
  if Defaults.Path.Raw.Cubes[Input[1]] then
	local NewCube = CubeList[Input[1]].Execute()
	io.write(Defaults.Prompt.Output, "Cube set to ", Input[1], "\n")
	return NewCube
  else
	io.write(Defaults.Prompt.Error, "The type", Input[1], " is invalid\n")
  end
end
return Set