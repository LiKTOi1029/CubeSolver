local Defaults = 
{
  Path = 
  {
	CommandsFolder = "data/commands/",
	Getter = "getter",
	Tablify = "modules/tablify/tablify",
	Status = "data/status",
	CubesFolder = "data/cubes/",
	HelpersFolder = "data/helpers/",
	Helper = 
	{
	  InputProcessor = "data/helpers/inputprocessor",
	},
	Raw = 
	{
	  Cubes = 
	  {
		["3X3"] = "data/cubes/regular/3x3",
	  },
	},
  },
  Prompt = 
  {
	Input = " > ",
	Error = "X> ",
  }
}
return Defaults