local value = Instance.new("Color3Value")
value.Parent = workspace

value.Changed:Connect(function(NewValue)
	print(NewValue)
end)

value.Value = Color3.fromRGB(50, 50, 50)
