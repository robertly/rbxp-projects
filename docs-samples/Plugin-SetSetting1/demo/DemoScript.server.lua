local RAN_BEFORE_KEY = "RunBefore"
local hasRunBefore = plugin:GetSetting(RAN_BEFORE_KEY)

if hasRunBefore then
	print("Welcome back!")
else
	print("Thanks for installing this plugin!")
	plugin:SetSetting(RAN_BEFORE_KEY, true)
end
