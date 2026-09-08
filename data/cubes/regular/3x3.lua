local Template = {"W", "B", "O", "G", "R", "Y"}
local X33 = {}
for Index, Color in ipairs(Template) do
  for SubIndex = 1, 9, 1 do
	if SubIndex == 5 then X33[#X33+1] = "+"
	else X33[#X33+1] = Color end
  end
end
return X33