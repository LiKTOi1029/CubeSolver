local Defaults = require("defaults")
local Status = require(Defaults.Path.Status)
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
local CubeList = {}
for Index, CubeFile in pairs(Defaults.Path.Raw.Cubes) do
  CubeList[Index] = require(CubeFile)
  io.write(Defaults.Prompt.Output, CubeFile, " initialized\n")
end
local Set = {}
function Set.Init()
  Status.Type = CubeList[1]
  Status.Cube = CubeList["3X3"]
  table.remove(Status.Cube, 1)
  io.write(Defaults.Prompt.Output, "Finished\n")
end
function Set.Execute(Input)
  Input = InputProcessor(Input)
  if type(Input) ~= "table" then io.write(Defaults.Prompt.Error, "Malformed input, please type help for help\n") end
  if Defaults.Path.Raw.Cubes[Input[1]] then
	Status.Cube = CubeList[Input[1]]
	Status.Type = Status.Cube[1]
	table.remove(Status.Cube, 1)
	io.write(Defaults.Prompt.Output, "Cube set to ", Status.Type, "\n")
  else
	io.write(Defaults.Prompt.Error, "The type", Input[1], " is invalid\n")
  end
end
return Set