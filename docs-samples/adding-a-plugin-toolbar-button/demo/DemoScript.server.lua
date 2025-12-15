local ServerScriptService = game:GetService("ServerScriptService")

local toolbar = plugin:CreateToolbar("Empty Script Adder")
local newScriptButton = toolbar:CreateButton("Add Script", "Create an empty Script", "rbxassetid://1507949215")

local function onNewScriptButtonClicked()
	local newScript = Instance.new("Script")
	newScript.Source = ""
	newScript.Parent = ServerScriptService
end

newScriptButton.Click:Connect(onNewScriptButtonClicked)
