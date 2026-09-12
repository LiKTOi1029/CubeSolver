local Get = {}
local Defaults = require("defaults")
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
function Get.Execute(Input, Cube)
  Input = InputProcessor(Input)
  if type(Input) == "number" then
	io.write(Defaults.Prompt.Output, Cube.Type, "\n")
	io.write(Defaults.Prompt.Dev, "This is not implemented yet, sorry!\n")
  else
	-- This is not an error, it displays the saved cubes if a filename is inputted
  end
end
return Get