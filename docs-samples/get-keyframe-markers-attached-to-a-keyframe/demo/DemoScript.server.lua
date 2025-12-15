local keyframe = Instance.new("Keyframe")
keyframe.Parent = workspace

local marker1 = Instance.new("KeyframeMarker")
marker1.Name = "FootStep"
marker1.Value = 100

local marker2 = Instance.new("KeyframeMarker")
marker2.Name = "Wave"
marker2.Value = 100

keyframe:AddMarker(marker1) --marker.Parent = keyframe
keyframe:AddMarker(marker2) --marker.Parent = keyframe

local markers = keyframe:GetMarkers()
for _, marker in pairs(markers) do
	print(marker.Name)
end
