local Selection = game:GetService("Selection")

for _, object in pairs(Selection:Get()) do
	if object:IsA("BasePart") then
		object.CFrame = object.CFrame * CFrame.Angles(0, math.pi / 2, 0)
	end
end
