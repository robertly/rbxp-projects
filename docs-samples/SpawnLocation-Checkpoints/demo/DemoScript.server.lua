local Teams = game:GetService("Teams")

-- create start team (AutoAssignable = true)
local startTeam = Instance.new("Team")
startTeam.Name = "Start"
startTeam.AutoAssignable = true
startTeam.TeamColor = BrickColor.new("White")
startTeam.Parent = Teams

-- create checkpoint teams (Autoassignable = false), ensuring all TeamColors are unique
local team1 = Instance.new("Team")
team1.Name = "Checkpoint 1"
team1.AutoAssignable = false
team1.TeamColor = BrickColor.new("Bright blue")
team1.Parent = Teams

local team2 = Instance.new("Team")
team2.Name = "Checkpoint 2"
team2.AutoAssignable = false
team2.TeamColor = BrickColor.new("Bright green")
team2.Parent = Teams

local team3 = Instance.new("Team")
team3.Name = "Checkpoint 2"
team3.AutoAssignable = false
team3.TeamColor = BrickColor.new("Bright red")
team3.Parent = Teams

-- create spawns
local startSpawn = Instance.new("SpawnLocation")
startSpawn.Anchored = true
startSpawn.Size = Vector3.new(5, 1, 5)
startSpawn.Neutral = false
startSpawn.AllowTeamChangeOnTouch = false
startSpawn.TeamColor = startTeam.TeamColor
startSpawn.BrickColor = startTeam.TeamColor
startSpawn.Parent = game.Workspace

local team1Spawn = Instance.new("SpawnLocation")
team1Spawn.Anchored = true
team1Spawn.Size = Vector3.new(5, 1, 5)
team1Spawn.Neutral = false
team1Spawn.AllowTeamChangeOnTouch = true
team1Spawn.TeamColor = team1.TeamColor
team1Spawn.BrickColor = team1.TeamColor
team1Spawn.Parent = game.Workspace

local team2Spawn = Instance.new("SpawnLocation")
team2Spawn.Anchored = true
team2Spawn.Size = Vector3.new(5, 1, 5)
team2Spawn.Neutral = false
team2Spawn.AllowTeamChangeOnTouch = true
team2Spawn.TeamColor = team2.TeamColor
team2Spawn.BrickColor = team2.TeamColor
team2Spawn.Parent = game.Workspace

local team3Spawn = Instance.new("SpawnLocation")
team3Spawn.Anchored = true
team3Spawn.Size = Vector3.new(5, 1, 5)
team3Spawn.Neutral = false
team3Spawn.AllowTeamChangeOnTouch = true
team3Spawn.TeamColor = team3.TeamColor
team3Spawn.BrickColor = team3.TeamColor
team3Spawn.Parent = game.Workspace

-- position spawns
startSpawn.CFrame = CFrame.new(0, 0.5, 0)
team1Spawn.CFrame = CFrame.new(10, 0.5, 0)
team2Spawn.CFrame = CFrame.new(20, 0.5, 0)
team3Spawn.CFrame = CFrame.new(30, 0.5, 0)
