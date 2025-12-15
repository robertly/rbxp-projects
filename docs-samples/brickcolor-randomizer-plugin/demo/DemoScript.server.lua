assert(plugin, "This script must be run as a plugin")

local Selection = game:GetService("Selection")

local toolbar = plugin:CreateToolbar("Parts")
local pluginToolbarButton = toolbar:CreateButton(
	"Randomize Colors",
	"Click this button to assign random colors to selected parts",
	"rbxassetid://5325741572" -- A rainbow
)

local function onClick()
	local selection = Selection:Get()
	for _, object in pairs(selection) do
		if object:IsA("BasePart") then
			object.BrickColor = BrickColor.random()
		end
	end
end
pluginToolbarButton.Click:Connect(onClick)

local function doesSelectionContainAPart()
	local selection = Selection:Get()
	for _, object in pairs(selection) do
		if object:IsA("BasePart") then
			return true
		end
	end
	return false
end

local function onSelectionChanged()
	pluginToolbarButton.Enabled = doesSelectionContainAPart()
end
Selection.SelectionChanged:Connect(onSelectionChanged)
onSelectionChanged()
