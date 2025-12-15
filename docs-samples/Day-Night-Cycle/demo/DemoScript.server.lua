local Lighting = game:GetService("Lighting")

local TIME_SPEED = 60 -- 1 min = 1 hour
local START_TIME = 9 -- 9am

local minutesAfterMidnight = START_TIME * 60
local waitTime = 60 / TIME_SPEED

while true do
	minutesAfterMidnight = minutesAfterMidnight + 1

	Lighting:SetMinutesAfterMidnight(minutesAfterMidnight)

	task.wait(waitTime)
end
