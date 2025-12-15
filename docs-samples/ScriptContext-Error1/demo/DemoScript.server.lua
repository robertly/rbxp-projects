local ScriptContext = game:GetService("ScriptContext")

local function onError(message, trace, script)
	print(script:GetFullName(), "errored!")
	print("Reason:", message)
	print("Trace:", trace)
end

ScriptContext.Error:Connect(onError)

-- Somewhere, in another script

error("Error occurred!")
