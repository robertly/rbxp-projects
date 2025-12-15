local ServerScriptService = game:GetService("ServerScriptService")
local SoundService = game:GetService("SoundService")

-- Create custom plugin button
local toolbar = plugin:CreateToolbar("Empty Script Adder")
local newScriptButton = toolbar:CreateButton("Add Script", "Create an empty Script", "rbxassetid://1507949215")

local function playLocalSound(soundId)
	local sound = Instance.new("Sound")
	sound.SoundId = soundId
	SoundService:PlayLocalSound(sound)
	sound.Ended:Wait()
	sound:Destroy()
end

local function onNewScriptButtonClicked()
	-- Create new empty script
	local newScript = Instance.new("Script")
	newScript.Source = ""
	newScript.Parent = ServerScriptService
	playLocalSound("rbxassetid://0") -- Insert audio asset ID here
end

newScriptButton.Click:Connect(onNewScriptButtonClicked)
