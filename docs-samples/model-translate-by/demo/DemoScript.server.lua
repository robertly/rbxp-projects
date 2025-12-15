local model = script.Parent.Model
local obstruction = script.Parent.Obstruction

task.wait(3)

-- Unlike MoveTo, TranslateBy will move relative to 'model's current position
-- and can move into obstructions
model:TranslateBy(obstruction.CFrame.Position - model.PrimaryPart.CFrame.Position)
