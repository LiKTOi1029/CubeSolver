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
	{22,20}, -- Orange edge rotation
	{20,24}, -- Orange edge rotation
	{24,26}, -- Orange edge rotation
	{26,22}, -- Orange edge rotation
  },
  ["L"] = 
  {
	{28,1}, -- Green into white
	{31,4}, -- Green into white
	{34,7}, -- Green into white
	{1,10}, -- White into blue
	{4,13}, -- White into blue
	{7,16}, -- White into blue
	{10,46}, -- Blue into yellow
	{13,49}, -- Blue into yellow
	{16,52}, -- Blue into yellow
	{46,28}, -- Yellow into green
	{49,31}, -- Yellow into green
	{52,34}, -- Yellow into green
	{37,39}, -- Red corner rotation
	{39,45}, -- Red corner rotation
	{45,43}, -- Red corner rotation
	{43,37}, -- Red corner rotation
	{38,42}, -- Red edge rotation
	{42,44}, -- Red edge rotation
	{44,40}, -- Red edge rotation
	{40,42}, -- Red edge rotation
  },
  ["U"] = 
  {
	{25,10}, -- Orange into blue
	{22,11}, -- Orange into blue
	{19,12}, -- Orange into blue
	{10,39}, -- Blue into red
	{11,42}, -- Blue into red
	{12,45}, -- Blue into red
	{39,36}, -- Red into green
	{42,35}, -- Red into green
	{45,34}, -- Red into green
	{34,19}, -- Green into orange
	{35,22}, -- Green into orange
	{36,25}, -- Green into orange
	{1,3}, -- White corner rotation
	{3,9}, -- White corner rotation
	{9,7}, -- White corner rotation
	{7,3}, -- White corner rotation
	{2,6}, -- White edge rotation
	{6,8}, -- White edge rotation
	{8,4}, -- White edge rotation
	{4,2}, -- White edge rotation
  },
  ["D"] = 
  {
	{37,16}, -- Red into blue
	{40,17}, -- Red into blue
	{43,18}, -- Red into blue
	{16,27}, -- Blue into orange
	{17,24}, -- Blue into orange
	{18,21}, -- Blue into orange
	{27,30}, -- Orange into green
	{24,29}, -- Orange into green
	{21,28}, -- Orange into green
	{30,37}, -- Green into red
	{29,40}, -- Green into red
	{28,43}, -- Green into red
	{46,48}, -- Yellow corner rotation
	{48,54}, -- Yellow corner rotation
	{54,52}, -- Yellow corner rotation
	{52,46}, -- Yellow corner rotation
	{47,51}, -- Yellow edge rotation
	{51,53}, -- Yellow edge rotation
	{53,49}, -- Yellow edge rotation
	{49,47}, -- Yellow edge rotation
  },
  ["F"] = 
  {
	{43,7}, -- Red into white
	{44,8}, -- Red into white
	{45,9}, -- Red into white
	{7,25}, -- White into orange
	{8,26}, -- White into orange
	{9,27}, -- White into orange
	{25,46}, -- Orange into yellow
	{26,47}, -- Orange into yellow
	{27,48}, -- Orange into yellow
	{48,43}, -- Yellow into red
	{47,40}, -- Yellow into red
	{46,37}, -- Yellow into red
	{10,12}, -- Blue corner rotation
	{12,18}, -- Blue corner rotation
	{18,16}, -- Blue corner rotation
	{16,10}, -- Blue corner rotation
	{11,15}, -- Blue edge rotation
	{15,17}, -- Blue edge rotation
	{17,13}, -- Blue edge rotation
	{13,10}, -- Blue edge rotation
  },
  ["B"] = 
  {
	{19,1}, -- Orange into white
	{20,2}, -- Orange into white
	{21,3}, -- Orange into white
	{1,37}, -- White into red
	{2,38}, -- White into red
	{3,39}, -- White into red
	{37,54}, -- Red into yellow 
	{38,53}, -- Red into yellow 
	{39,52}, -- Red into yellow 
	{54,19}, -- Yellow into orange
	{53,20}, -- Yellow into orange
	{52,21}, -- Yellow into orange
	{28,30}, -- Green corner rotation
	{30,36}, -- Green corner rotation
	{36,34}, -- Green corner rotation
	{34,28}, -- Green corner rotation
	{29,33}, -- Green edge rotation
	{33,35}, -- Green edge rotation
	{35,31}, -- Green edge rotation
	{31,29}, -- Green edge rotation
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