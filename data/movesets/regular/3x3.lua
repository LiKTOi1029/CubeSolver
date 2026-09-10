local UniqueCopy = require("data/helpers/uniquecopy")
local Moveset = 
{
  ["R"] = 
  {
	{13,4}, -- Blue into white
	{16,7}, -- Blue into white
	{19,10}, -- Blue into white
	{4,31}, -- White into green
	{7,34}, -- White into green
	{10,37}, -- White into green
	{31,49}, -- Green into yellow
	{34,52}, -- Green into yellow
	{37,55}, -- Green into yellow
	{49,13}, -- Yellow into blue
	{52,16}, -- Yellow into blue
	{55,19}, -- Yellow into blue
	{20,22}, -- Orange corner rotation
	{22,26}, -- Orange corner rotation
	{26,28}, -- Orange corner rotation
	{28,20}, -- Orange corner rotation
	{21,25}, -- Orange edge rotation
	{25,27}, -- Orange edge rotation
	{27,23}, -- Orange edge rotation
	{23,21}, -- Orange edge rotation
  },
  ["R'"] = 
  {
	{31,4}, -- Green into white
	{34,7}, -- Green into white
	{37,10}, -- Green into white
	{4,13}, -- White into blue
	{7,16}, -- White into blue 
	{10,19}, -- White into blue
	{13,49}, -- Blue into yellow
	{16,52}, -- Blue into yellow
	{19,55}, -- Blue into yellow
	{49,31}, -- Yellow into Green
	{52,34}, -- Yellow into Green
	{55,37}, -- Yellow into Green
	{20,26}, -- Orange corner rotation
	{26,28}, -- Orange corner rotation
	{28,22}, -- Orange corner rotation
	{22,20}, -- Orange corner rotation
	{21,23}, -- Orange edge rotation
	{23,27}, -- Orange edge rotation
	{27,25}, -- Orange edge rotation
	{25,21}, -- Orange edge rotation
  },
  ["L"] = {},
  ["L'"] = {},
  ["U"] = {},
  ["U'"] = {},
  ["D"] = {},
  ["D'"] = {},
  ["F"] = {},
  ["F'"] = {},
  ["D"] = {},
  ["D'"] = {},
}
function Moveset.Execute(Input, Cube)
  local Copy = UniqueCopy(Cube)
  if Moveset[Input] then
	for Index, Movement in ipairs(Moveset[Input]) do
	  Cube[Movement[2]] = Copy[Movement[1]]
	end
  else
	io.write(Defaults.Prompt.Error, Input, " is not a valid instruction\n")
  end
  return Cube
end

return Moveset