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
	  UniqueCopy = "data/helpers/uniquecopy",
	  Debug = "data/helpers/debug",
	},
	Raw = 
	{
	  Cubes = 
	  {
		["3X3"] = "data/cubes/regular/3x3",
	  },
	  Movesets = 
	  {
		["3X3"] = "data/movesets/regular/3x3",
	  },
	},
  },
  Prompt = 
  {
	Input = " > ",
	Error = "X> ",
	Warning = "/> ",
	Output = ">> ",
	Debug = "D> ",
  },
  Commands = 
  {
	Global = 
	{
	  Delimiter = " ",
	},
  },
}
return Defaults