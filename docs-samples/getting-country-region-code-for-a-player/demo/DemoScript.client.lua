local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local result, code = pcall(LocalizationService.GetCountryRegionForPlayerAsync, LocalizationService, player)

if result and code == "CA" then
	print("Hello, friend from Canada!")
else
	print("GetCountryRegionForPlayerAsync failed: " .. code)
end
