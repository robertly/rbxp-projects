local TeleportService = game:GetService("TeleportService")

local teleportData = TeleportService:GetLocalPlayerTeleportData()

print("Local player arrived with this data:", teleportData)
