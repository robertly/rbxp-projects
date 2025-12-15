local ContextActionService = game:GetService("ContextActionService")

local INPUT_KEY1 = Enum.KeyCode.Q
local INPUT_KEY2 = Enum.KeyCode.E

local function handleThrow(_, inputState, _)
	if inputState ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end

	print("Throw")
	return Enum.ContextActionResult.Sink
end

local function handlePunch(_, inputState, _)
	if inputState ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end

	print("Punch")
	return Enum.ContextActionResult.Sink
end

-- Without specifying priority, the most recently bound action is called first,
-- so pressing INPUT_KEY1 prints "Punch" and then sinks the input.
ContextActionService:BindAction("DefaultThrow", handleThrow, false, INPUT_KEY1)
ContextActionService:BindAction("DefaultPunch", handlePunch, false, INPUT_KEY1)

-- Here we bind both functions in the same order as above, but with explicitly swapped priorities.
-- That is, we give "Throw" a higher priority of 2 so it will be called first,
-- despite "Punch" still being bound more recently.
-- Pressing INPUT_KEY2 prints "Throw" and then sinks the input.
ContextActionService:BindActionAtPriority("PriorityThrow", handleThrow, false, 2, INPUT_KEY2)
ContextActionService:BindActionAtPriority("PriorityPunch", handlePunch, false, 1, INPUT_KEY2)
