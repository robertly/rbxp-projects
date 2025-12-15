local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui
local victorySound = SoundService.VictorySound
local defeatSound = SoundService.DefeatSound
local gui = playerGui:WaitForChild("RoundResultsGui")

local roundWinnerRemote = ReplicatedStorage.Instances.RoundWinnerEvent

local VICTORY_TEXT = "Victory!"
local DEFEAT_TEXT = "Defeat..."
local WINNER_TEXT_FORMAT_STRING = "%s wins"

local BACKGROUND_TWEEN_INFO = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local TEXT_TWEEN_INFO = TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)

local SHOW_RESULT_TIME_SECONDS = 5

local function onRoundWinner(winner: Team, localTeam: Team?)
	local victoryDefeatText = "Round ended!"
	if localTeam then
		-- If our team won, we'll display Victory! Otherwise display Defeat...
		local isVictory = winner == localTeam
		if isVictory then
			victorySound:Play()
			victoryDefeatText = VICTORY_TEXT
		else
			defeatSound:Play()
			victoryDefeatText = DEFEAT_TEXT
		end
	end

	gui.Background.BackgroundTransparency = 1
	gui.UIScale.Scale = 2
	gui.VictoryDefeatLabel.TextTransparency = 1
	gui.VictoryDefeatLabel.Text = victoryDefeatText
	gui.WinnerLabel.TextTransparency = 1
	gui.WinnerLabel.Text = string.format(WINNER_TEXT_FORMAT_STRING, winner.Name)
	gui.WinnerLabel.TextColor3 = winner.TeamColor.Color
	gui.Enabled = true

	local backgroundTween = TweenService:Create(gui.Background, BACKGROUND_TWEEN_INFO, { BackgroundTransparency = 0.5 })
	backgroundTween:Play()

	local scaleTween = TweenService:Create(gui.UIScale, TEXT_TWEEN_INFO, { Scale = 1 })
	local textTweenA = TweenService:Create(gui.VictoryDefeatLabel, TEXT_TWEEN_INFO, { TextTransparency = 0 })
	local textTweenB = TweenService:Create(gui.WinnerLabel, TEXT_TWEEN_INFO, { TextTransparency = 0 })

	scaleTween:Play()
	textTweenA:Play()
	textTweenB:Play()

	task.delay(SHOW_RESULT_TIME_SECONDS, function()
		gui.Enabled = false
	end)
end

roundWinnerRemote.OnClientEvent:Connect(onRoundWinner)
