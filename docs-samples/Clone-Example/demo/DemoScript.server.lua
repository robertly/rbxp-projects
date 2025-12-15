local Workspace = game:GetService("Workspace")

-- Get a reference to an existing object
local model = script.Parent.Model

-- Create a clone of the model
local clone = model:Clone()

-- Move the clone so it's not overlapping the original model
clone:PivotTo(model.PrimaryPart.CFrame - (Vector3.xAxis * 10))

-- Add the clone to the Workspace
clone.Parent = Workspace
