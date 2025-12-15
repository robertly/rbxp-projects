local cframeValue = script.Parent.CFrameValue

cframeValue.Changed:Connect(print)

cframeValue.Value = CFrame.new(1, 2, 3)
