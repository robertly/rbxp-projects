plugin:SelectRibbonTool(Enum.RibbonTool.Move, UDim2.new())
task.wait() -- wait for next frame
local selectedRibbonTool = plugin:GetSelectedRibbonTool()
print("The selected RibbonTool is", selectedRibbonTool)
