local Defaults = 
{
  Path = 
  {
	CommandsFolder = "data/commands/",
	Getter = "getter",
	Tablify = "modules/tablify/tablify",
	Status = "data/status",
	Cubes = 
	{
	  Regular = 
	  {
		X33 = "data/cubes/regular/3x3",
	  },
	},
	Raw = 
	{
	  Cubes = 
	  {
		["3X3"] = require("data/cubes/regular/3x3")
	  }
	}
  },
  Prompt = 
  {
	Input = " > ",
	Error = "X> ",
  }
}
return Defaults