local Defaults = require("defaults")
local Scramble = {}
function Scramble.Execute(Input, Cube, CubeType)
  local SelectedMoveset = require(Defaults.Path.Raw.Movesets[CubeType])
  if type(Input) == "table" then
	-- I haven't implemented this, but it will use files to come up with more customized scrambles.
	-- Outside of the scope of the 1 week window of this project.
  else
	local RandomizedNumber = math.random(20, 30)
	local Type = Defaults.Commands.Scramble[CubeType]
	local PrimeTable = Defaults.Commands.Global.Primes
	local Min, Max = 1, #Type
	local NewMove, PreviousMove, Prime = nil, ""
	local FullMoves = {}
	for i = 1, RandomizedNumber, 1 do
	  NewMove = Type[math.random(Min, Max)]
	  Prime = PrimeTable[math.random(1,2)]
	  if not PreviousMove:find(NewMove) then
		NewMove = NewMove .. Prime
	  end
	  PreviousMove = NewMove
	  FullMoves[#FullMoves] = PreviousMove
	end
	for Index, Move in ipairs(FullMoves) do
	  SelectedMoveset.Execute(Move, Cube)
	end
  end
end
return Scramble