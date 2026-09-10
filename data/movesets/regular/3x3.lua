local Defaults = require("defaults")
local UniqueCopy = require(Defaults.Path.Helper.UniqueCopy)
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
  ["L"] = 
  {
	{29,2}, -- Green into white
	{32,5}, -- Green into white
	{35,8}, -- Green into white
	{2,11}, -- White into blue
	{5,14}, -- White into blue
	{8,17}, -- White into blue
	{11,47}, -- Blue into yellow
	{14,50}, -- Blue into yellow
	{17,53}, -- Blue into yellow
	{47,29}, -- Yellow into green
	{50,32}, -- Yellow into green
	{53,35}, -- Yellow into green
	{38,40}, -- Red corner rotation
	{40,44}, -- Red corner rotation
	{44,46}, -- Red corner rotation
	{46,38}, -- Red corner rotation
	{39,43}, -- Red edge rotation
	{43,45}, -- Red edge rotation
	{45,41}, -- Red edge rotation
	{41,39}, -- Red edge rotation
  },
  ["L'"] = 
  {
	{11,2}, -- Blue into white
	{14,5}, -- Blue into white
	{17,8}, -- Blue into white
	{2,29}, -- White into green
	{5,32}, -- White into green
	{8,35}, -- White into green
	{29,47}, -- Green into yellow
	{32,50}, -- Green into yellow
	{35,53}, -- Green into yellow
	{47,11}, -- Yellow into blue
	{50,14}, -- Yellow into blue
	{53,17}, -- Yellow into blue
	{38,44}, -- Red corner rotation
	{44,46}, -- Red corner rotation
	{46,40}, -- Red corner rotation
	{40,38}, -- Red corner rotation
	{39,41}, -- Red edge rotation
	{41,45}, -- Red edge rotation
	{45,43}, -- Red edge rotation
	{43,39}, -- Red edge rotation
  },
  ["U"] = 
  {
	{11,38}, -- Blue into red
	{12,39}, -- Blue into red
	{13,40}, -- Blue into red
	{38,29}, -- Red into green
	{39,30}, -- Red into green
	{40,31}, -- Red into green
	{29,20}, -- Green into orange
	{30,21}, -- Green into orange
	{31,22}, -- Green into orange
	{20,11}, -- Orange into blue
	{21,12}, -- Orange into blue
	{22,13}, -- Orange into blue
	{2,4}, -- White corner rotation
	{4,10}, -- White corner rotation
	{10,8}, -- White corner rotation
	{8,2}, -- White corner rotation
	{3,7}, -- White edge rotation
	{7,9}, -- White edge rotation
	{9,5}, -- White edge rotation
	{5,3}, -- White edge rotation
  },
  ["U'"] = 
  {
	{11,20}, -- Blue into orange
	{12,21}, -- Blue into orange
	{13,22}, -- Blue into orange
	{20,29}, -- Orange into green
	{21,30}, -- Orange into green
	{22,31}, -- Orange into green
	{29,38}, -- Green into red
	{30,39}, -- Green into red
	{31,40}, -- Green into red
	{38,11}, -- Red into blue
	{39,12}, -- Red into blue
	{40,13}, -- Red into blue
	{2,8}, -- White corner rotation
	{8,10}, -- White corner rotation
	{10,4}, -- White corner rotation
	{4,2}, -- White corner rotation
	{3,5}, -- White edge rotation
	{5,9}, -- White edge rotation
	{9,7}, -- White edge rotation
	{7,3}, -- White edge rotation
  },
  ["D"] = 
  {
	{17,26}, -- Blue into orange
	{18,27}, -- Blue into orange
	{19,28}, -- Blue into orange
	{26,35}, -- Orange into green
	{27,36}, -- Orange into green
	{28,37}, -- Orange into green
	{35,44}, -- Green into red
	{36,45}, -- Green into red
	{37,46}, -- Green into red
	{44,17}, -- Red into blue
	{45,18}, -- Red into blue
	{46,19}, -- Red into blue
	{47,49}, -- Yellow corner rotation
	{49,55}, -- Yellow corner rotation
	{55,53}, -- Yellow corner rotation
	{53,47}, -- Yellow corner rotation
	{48,52}, -- Yellow edge rotation
	{52,54}, -- Yellow edge rotation
	{54,50}, -- Yellow edge rotation
	{50,48}, -- Yellow edge rotation
  },
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