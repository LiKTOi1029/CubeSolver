local UniqueCopy = function(Table)
  local Copy = {}
  for i, v in ipairs(Table) do
	Copy[i] = v
  end
  return Copy
end
return UniqueCopy