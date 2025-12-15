local model = script.Parent.Model
local obstruction = script.Parent.Obstruction

task.wait(3)

-- MoveTo will not move 'model' inside of 'obstruction'
-- Instead, 'model' is placed in the closest position outside 'obstruction'
model:MoveTo(obstruction.Position)
