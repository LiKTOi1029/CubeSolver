local Defaults = require("defaults")
local Getter = require(Defaults.Path.Getter)
local Tablify = require(Defaults.Path.Tablify)
Getter.Commands["SET"].Execute({"set", "3X3"})

function love.update(dt)
  io.write(Defaults.Prompt.Input)
  local Choice = Tablify.Execute("NORMAL", io.read():upper(), " ")
  if Choice[1] == "EXIT" then love.event.quit()
  elseif Getter.Commands[Choice[1]] then
	Getter.Commands[Choice[1]].Execute(Choice)
  end
end