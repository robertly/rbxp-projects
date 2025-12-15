local part = Instance.new("Part")
part.Anchored = true
part.Position = Vector3.new(0, 1, 0)
part.Parent = workspace

part.Touched:Connect(function()
	print("part touched!")
end)

local touchTransmitter = part:WaitForChild("TouchInterest")
if touchTransmitter then
	print("removing TouchTransmitter!")
	touchTransmitter:Destroy()
end
