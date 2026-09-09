local InputProcessor = function(Input)
  table.remove(Input, 1)
  if #Input == 0 then return 1 else return Input end
end
return InputProcessor