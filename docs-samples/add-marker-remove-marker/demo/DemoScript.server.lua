local keyframe = Instance.new("Keyframe")
keyframe.Parent = workspace

local marker = Instance.new("KeyframeMarker")
marker.Name = "FootStep"
marker.Value = 100

keyframe:AddMarker(marker) --marker.Parent = keyframe

task.wait(2)

keyframe:RemoveMarker(marker) --marker.Parent = nil
