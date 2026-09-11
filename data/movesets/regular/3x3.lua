local Defaults = require("defaults")
local UniqueCopy = require(Defaults.Path.Helper.UniqueCopy)
local BooleanTree
BooleanTree = 
{
  [false] = 
  {
	[true] = function(SubMoveset, Cube, Copy) -- DoubleMove
	  -- not implemented, probably won't be for a long time as well lmao
	end
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
	{12,3}, -- Blue into white
	{15,6}, -- Blue into white
	{18,9}, -- Blue into white
	{3,30}, -- White into green
	{6,33}, -- White into green
	{9,36}, -- White into green
	{30,48}, -- Green into yellow
	{33,51}, -- Green into yellow
	{36,54}, -- Green into yellow
	{48,12}, -- Yellow into blue
	{51,15}, -- Yellow into blue
	{54,18}, -- Yellow into blue
	{19,21}, -- Orange corner rotation
	{21,27}, -- Orange corner rotation
	{27,25}, -- Orange corner rotation
	{25,19}, -- Orange corner rotation
	{20,24}, -- Orange edge rotation
	{24,26}, -- Orange edge rotation
	{26,22}, -- Orange edge rotation
	{22,20}, -- Orange edge rotation
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