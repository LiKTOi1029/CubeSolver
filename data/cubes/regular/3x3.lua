local Cube = {}
function Cube.Execute()
  local Template = 
  {
	["U"] = {[Position] = {0, 1, 0}, [Color] = "WHITE"},
	["D"] = {[Position] = {0, -1, 0}, [Color] = "YELLOW"},
	["F"] = {[Position] = {0, 0, 1}, [Color] = "BLUE"},
	["B"] = {[Position] = {0 0, -1}, [Color] = "GREEN"},
	["R"] = {[Position] = {1, 0, 0}, [Color] = "ORANGE"},
	["L"] = {[Position] = {-1, 0, 0}, [Color] = "RED"},
  }
  local Type = {"3X3"}
  local X33 = {}
  X33.Type = Type
  X33.Cube = Template
  return X33
end
return Cube