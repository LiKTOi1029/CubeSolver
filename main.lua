local Defaults = require("defaults")
local Getter = require(Defaults.Path.Getter)
local Tablify = require(Defaults.Path.Tablify)
local Status = require(Defaults.Path.Status)
local Cube, Type = Getter.Commands["SET"].Execute({"set", "3X3"}, Status.Cube, Status.Type)

function love.update(dt)
  io.write(Defaults.Prompt.Input)
  local Choice = Tablify.Execute("NORMAL", io.read():upper(), " ")
  if Choice[1] == "EXIT" then love.event.quit()
  elseif Getter.Commands[Choice[1]] then
	local IfCube, IfType = Getter.Commands[Choice[1]].Execute(Choice, Cube, Type)
	if type(IfCube) == "table" then Cube = IfCube end
	if type(IfType) == "string" then Type = IfType end
  end
end