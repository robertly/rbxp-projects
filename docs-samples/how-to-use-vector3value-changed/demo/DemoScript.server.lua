local value = Instance.new("Vector3Value")
value.Parent = workspace

value.Changed:Connect(function(NewValue)
	print(NewValue)
end)

value.Value = Vector3.new(10, 10, 10)
