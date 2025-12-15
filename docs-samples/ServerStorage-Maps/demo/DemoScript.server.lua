local ServerStorage = game:GetService("ServerStorage")

local ROUND_TIME = 5

local map1 = Instance.new("Model")
map1.Name = "Map1"
map1.Parent = ServerStorage

local map2 = Instance.new("Model")
map2.Name = "Map2"
map2.Parent = ServerStorage

local map3 = Instance.new("Model")
map3.Name = "Map3"
map3.Parent = ServerStorage

local maps = { map1, map2, map3 }
local RNG = Random.new()
local currentMap = nil
local lastPick = nil

while true do
	print("New map!")

	-- remove current map
	if currentMap then
		currentMap:Destroy()
	end

	-- pick a map
	local randomPick = nil
	if #maps > 1 then
		repeat
			randomPick = RNG:NextInteger(1, #maps)
		until randomPick ~= lastPick
		lastPick = randomPick
	end

	-- fetch new map
	local map = maps[randomPick]
	currentMap = map:Clone()
	currentMap.Parent = workspace

	task.wait(ROUND_TIME)
end
