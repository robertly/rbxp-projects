local Workspace = game:GetService("Workspace")

local terrain = Workspace.Terrain
local resolution = 4
local region = Region3.new(Vector3.new(0, 0, 0), Vector3.new(16, 28, 20)):ExpandToGrid(resolution)
local materials = {
	{
		{
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
		},
		{ Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock },
		{ Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock },
		{ Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand },
		{ Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand },
		{ Enum.Material.Mud, Enum.Material.Mud, Enum.Material.Mud, Enum.Material.Mud, Enum.Material.Mud },
		{ Enum.Material.Air, Enum.Material.Air, Enum.Material.Air, Enum.Material.Air, Enum.Material.Air },
	},
	{
		{
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
		},
		{ Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock },
		{ Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock },
		{ Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand },
		{ Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand },
		{ Enum.Material.Mud, Enum.Material.Snow, Enum.Material.Snow, Enum.Material.Snow, Enum.Material.Mud },
		{ Enum.Material.Air, Enum.Material.Snow, Enum.Material.Snow, Enum.Material.Snow, Enum.Material.Air },
	},
	{
		{
			Enum.Material.CrackedLava,
			Enum.Material.Sand,
			Enum.Material.Sand,
			Enum.Material.Sand,
			Enum.Material.CrackedLava,
		},
		{ Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock },
		{ Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock },
		{ Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand },
		{ Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand },
		{ Enum.Material.Mud, Enum.Material.Snow, Enum.Material.Snow, Enum.Material.Snow, Enum.Material.Mud },
		{ Enum.Material.Air, Enum.Material.Snow, Enum.Material.Snow, Enum.Material.Snow, Enum.Material.Air },
	},
	{
		{
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
			Enum.Material.CrackedLava,
		},
		{ Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock },
		{ Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock, Enum.Material.Rock },
		{ Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand },
		{ Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand, Enum.Material.Sand },
		{ Enum.Material.Mud, Enum.Material.Mud, Enum.Material.Mud, Enum.Material.Mud, Enum.Material.Mud },
		{ Enum.Material.Air, Enum.Material.Air, Enum.Material.Air, Enum.Material.Air, Enum.Material.Air },
	},
}
local occupancies = {
	{
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 0.5, 0.5, 0.5, 0.5, 0.5 },
		{ 0, 0, 0, 0, 0 },
	},
	{
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 0.5, 1, 1, 1, 0.5 },
		{ 0, 1, 1, 1, 0 },
	},
	{
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 0.5, 1, 1, 1, 0.5 },
		{ 0, 1, 1, 1, 0 },
	},
	{
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 1, 1, 1, 1, 1 },
		{ 0.5, 0.5, 0.5, 0.5, 0.5 },
		{ 0, 0, 0, 0, 0 },
	},
}

terrain:WriteVoxels(region, resolution, materials, occupancies)
