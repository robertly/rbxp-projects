local value = Instance.new("StringValue")
value.Parent = workspace

value.Changed:Connect(function(NewValue)
	print(NewValue)
end)

value.Value = "Hello world!"
