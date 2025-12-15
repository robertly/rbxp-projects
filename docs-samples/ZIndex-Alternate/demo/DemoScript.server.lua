-- Place this in a LocalScript that is a sibling of
-- two GuiObjects called "FrameA" and "FrameB"
local gui = script.Parent
local frameA = gui:WaitForChild("FrameA")
local frameB = gui:WaitForChild("FrameB")

while true do
	-- A < B, so A a renders first (on bottom)
	frameA.ZIndex = 1
	frameB.ZIndex = 2
	task.wait(1)
	-- A > B, so A renders second (on top)
	frameA.ZIndex = 2
	frameB.ZIndex = 1
	task.wait(1)
end
