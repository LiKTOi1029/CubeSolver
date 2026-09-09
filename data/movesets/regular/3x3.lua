local Moveset = 
{
  ["R"] = 
  {
	{
	  13,
	  4,
	}, -- Blue into white
	{
	  16,
	  7,
	}, -- Blue into white
	{
	  19,
	  10,
	}, -- Blue into white
	{
	  4,
	  31,
	}, -- White into green
	{
	  7,
	  34,
	}, -- White into green
	{
	  10,
	  37,
	}, -- White into green
	{
	  31,
	  49,
	}, -- Green into yellow
	{
	  34,
	  52,
	}, -- Green into yellow
	{
	  37,
	  55,
	}, -- Green into yellow
	{
	  49,
	  13,
	}, -- Yellow into blue
	{
	  52,
	  16,
	}, -- Yellow into blue
	{
	  55,
	  19,
	}, -- Yellow into blue
	{
	  20,
	  22,
	}, -- Orange corner rotation
	{
	  22,
	  26,
	}, -- Orange corner rotation
	{
	  26,
	  28,
	}, -- Orange corner rotation
	{
	  28,
	  20
	}, -- Orange corner rotation
	{
	  21,
	  25,
	}, -- Orange corner rotation
	{
	  25,
	  27,
	}, -- Orange corner rotation
	{
	  27,
	  23,
	}, -- Orange corner rotation
	{
	  23,
	  21
	}, -- Orange corner rotation
  },
  ["L"] = {},
  ["U"] = {},
  ["D"] = {},
  ["F"] = {},
  ["D"] = {},
}
function Moveset.Execute(Input)
  Moveset.LocalCopy = Status.Cube
  if Moveset[Input] then
	for Index, Movement in ipairs(Moveset[Input]) do
	  Status.Cube[Movement[2]] = Moveset.LocalCopy[Movement[1]]
	end
  else
	io.write(Defaults.Prompt.Error, Input, " is not a valid instruction\n")
  end
end

return Moveset