local Defaults = require("defaults")
local Status = require(Defaults.Path.Status)
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
local CubeList = {}
for Index, CubeFile in pairs(Defaults.Path.Raw.Cubes) do
  CubeList[Index] = require(CubeFile)
end
local Set = {}
function Set.Execute(Input)
  Input = InputProcessor(Input)
  if type(Input) == "number" then io.write(Defaults.Prompt.Error, "Malformed input, please type help for help\n") return end
  if Defaults.Path.Raw.Cubes[Input[1]] then
	local NewCube = CubeList[Input[1]].Execute()
	Status.Type = NewCube[1]
	table.remove(NewCube, 1)
	Status.Cube = NewCube
	io.write(Defaults.Prompt.Output, "Cube set to ", Input[1], "\n")
  else
	io.write(Defaults.Prompt.Error, "The type", Input[1], " is invalid\n")
  end
end
return Set