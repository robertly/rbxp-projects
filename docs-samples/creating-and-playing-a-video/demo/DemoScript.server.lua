local screenPart = Instance.new("Part")
screenPart.Parent = workspace

local surfaceGui = Instance.new("SurfaceGui")
surfaceGui.Parent = screenPart

local videoFrame = Instance.new("VideoFrame")
videoFrame.Parent = surfaceGui

videoFrame.Looped = true
videoFrame.Video = "rbxassetid://" -- add an asset ID to this

while not videoFrame.IsLoaded do
	task.wait()
end

videoFrame:Play()
