local Get = {}
local Defaults = require("defaults")
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
local Status = require(Defaults.Path.Status)
function Get.Execute(Input)
  Input = InputProcessor(Input)
  if #Input == 0 then
	io.write(Defaults.Prompt.Output, table.concat(Status.Cube), "\n")
  else
	-- This is not an error, it displays the saved cubes if a filename is inputted
  end
end
return Get