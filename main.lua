local Defaults = require("defaults")
local Getter = require(Defaults.Path.Getter)
function love.update(dt)
  io.write(Defaults.Prompt.Input)
  local Choice = io.read():upper()
  if Choice == "EXIT" then love.event.quit()
  else end
end