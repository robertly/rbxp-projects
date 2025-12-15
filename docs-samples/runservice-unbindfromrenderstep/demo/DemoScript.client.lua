local RunService = game:GetService("RunService")

-- Step 1: Declare the function and a name
local name = "Print Hello"
local function printHello()
	print("Hello")
end

-- Step 2: Bind the function
RunService:BindToRenderStep(name, Enum.RenderPriority.First.Value, printHello)

-- Step 3: Unbind the function
local success, message = pcall(function()
	RunService:UnbindFromRenderStep(name)
end)

if success then
	print("Success: Function unbound!")
else
	print("An error occurred: " .. message)
end
