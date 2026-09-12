local Cube = {}
function Cube.Execute()
  local Template = 
  {
	["U"] = {Position = { X = 0, Y = 1, Z = 0}, Color = "WHITE"},
	["D"] = {Position = { X = 0, Y = -1, Z = 0}, Color = "YELLOW"},
	["F"] = {Position = { X = 0, Y = 0, Z = 1}, Color = "BLUE"},
	["B"] = {Position = { X = 0, Y = 0, Z = -1}, Color = "GREEN"},
	["R"] = {Position = { X = 1, Y = 0, Z = 0}, Color = "ORANGE"},
	["L"] = {Position = { X = -1, Y = 0, Z = 0}, Color = "RED"},
  }
  local Type = {"3X3"}
  local X33 = {}
  X33.Type = Type
  X33.Cube = Template
  return X33
end
return Cube