local Defaults = require("defaults")
local UniqueCopy = require(Defaults.Path.Helper.UniqueCopy)
local BooleanTree
BooleanTree = 
{
  [false] = 
  {
	[true] = function(SubMoveset, Cube, Copy) -- DoubleMove
	  -- not implemented, probably won't be for a long time as well lmao
	end,
	[false] = function(SubMoveset, Cube, Copy) -- Normal
	  for Index, FacePair in ipairs(SubMoveset) do
		Cube[FacePair[2]] = Copy[FacePair[1]]
	  end
	end,
  },
  [true] = 
  {
	[false] = function(SubMoveset, Cube, Copy) -- Reversal
	  for Index, FacePair in ipairs(SubMoveset) do
		Cube[FacePair[1]] = Copy[FacePair[2]]
	  end
	end,
	[true] = function(SubMoveset, Cube, Copy) -- Something very wrong
	  io.write(Defaults.Prompt.Error, "Something went seriously wrong, BooleanTable was true, true\n")
	  return Cube, Copy
	end
  },
}

local Moveset = 
{
  ["R"] = 
  {
	
  },
  ["L"] = 
  {
  },
  ["U"] = 
  {
  },
  ["D"] = 
  {
  },
  ["F"] = 
  {
  },
  ["B"] = 
  {
  },
}
function Moveset.Mover(SubMoveset, Cube, BooleanTable)
  local Copy = UniqueCopy(Cube)
  BooleanTree[BooleanTable[1]][BooleanTable[2]](SubMoveset, Cube, Copy)
end
function Moveset.Execute(Input, Cube)
  local BooleanTable = {false, false} -- The first index is Reversal, the second is DoubleMove
  local TableCheckingInput = Input:gsub("[%'%2%s]+","")
  if Moveset[TableCheckingInput] then
	local SubMoveset = Moveset[TableCheckingInput]
	local DoubleMove = Input:find("2")
	local Reversal = Input:find("'")
	if Reversal and not DoubleMove then BooleanTable[1] = true end
	if DoubleMove and not Reversal then BooleanTable[2] = true end
	Moveset.Mover(SubMoveset, Cube, BooleanTable)
  else
	io.write(Defaults.Prompt.Error, Input, " is not a valid instruction\n")
  end
  return Cube
end

return Moveset