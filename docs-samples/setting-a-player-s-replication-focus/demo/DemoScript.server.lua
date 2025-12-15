local Players = game:GetService("Players")

local PLAYER_NAME = "polarpanda16"

local player = Players:WaitForChild(PLAYER_NAME)

local part = Instance.new("Part")
part.Parent = workspace
part.Name = "ReplicationFocusPart"
part.Anchored = true
player.ReplicationFocus = part
