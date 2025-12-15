local RAN_BEFORE_KEY = "RanBefore"
local didRunBefore = plugin:GetSetting(RAN_BEFORE_KEY)

if didRunBefore then
	print("Welcome back!")
else
	plugin:SetSetting(RAN_BEFORE_KEY, true)
	print("Welcome! Thanks for installing this plugin!")
end
