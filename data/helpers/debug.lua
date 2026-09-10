local Debug
Debug.Number = 0
Debug.File = ".log"
Debug.Types = 
{
  ["INSERTION"] = function(Data)
	local File = io.open(Debug.Number .. Debug.File, "r")
	local FileData = File:read("*all")
	if FileData:len() > 5000 then Debug.Number = Debug.Number + 1 end
	File:close()
	local File = io.open(Debug.Number .. Debug.File, "a")
	File:write("\n", os.date(), "\n", Data, "\n")
	File:close()
  end
}
function Debug.Execute(Type, Data)
  if Debug.Types[Type] then
	Debug.Types[Type](Data)
  else
	io.write(Defaults.Prompt.Error, Type, " is not a valid debugging type\n")
  end
end
return Debug