local Get = {}
local Defaults = require("defaults")
local InputProcessor = require(Defaults.Path.Helper.InputProcessor)
local Status = require(Defaults.Path.Status)
function Get.Execute(Input)
  Input = InputProcessor(Input)
  if type(Input) == "number" then
	io.write(Defaults.Prompt.Output, Status.Type, "\n")
	local ParsingString = ""
	for Index, Face in ipairs(Status.Cube) do
	  if Index % 9 == 0 then
		ParsingString = ParsingString..Face
		io.write(Defaults.Prompt.Output, ParsingString, "\n")
		ParsingString = ""
	  else
	    ParsingString = ParsingString..Face
	  end
	end
  else
	-- This is not an error, it displays the saved cubes if a filename is inputted
  end
end
return Get