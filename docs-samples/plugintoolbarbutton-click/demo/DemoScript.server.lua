assert(plugin, "This script must be run as a plugin")

local toolbar = plugin:CreateToolbar("Hello World Plugin Toolbar")
local pluginToolbarButton =
	toolbar:CreateButton("Print Hello World", "Click this button to print Hello World!", "rbxassetid://133293265")

local function onClick()
	print("Hello, world")
end

pluginToolbarButton.Click:Connect(onClick)
