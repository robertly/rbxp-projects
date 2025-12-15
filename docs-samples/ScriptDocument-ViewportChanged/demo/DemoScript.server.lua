--!nocheck

--[[
	To run:
		1. Ensure Output view is open
		2. Run the below code in the Command Bar
		3. Scroll up and down in the opened Script window

	Print statements from the ViewportChanged event will appear in the Output
]]

local Workspace = game:GetService("Workspace")
local ScriptEditorService = game:GetService("ScriptEditorService")

-- Create text that spans many lines
local dummyText = string.rep("-- Dummy Text\n", 60)

-- Create a script containing the dummy text and open it
local otherScript = Instance.new("Script")
otherScript.Source = dummyText
otherScript.Parent = Workspace
local success, err = ScriptEditorService:OpenScriptDocumentAsync(otherScript)
if not success then
	warn(`Failed to open script because: {err}`)
	return
end

-- Get a reference to the opened script
local scriptDocument = ScriptEditorService:FindScriptDocument(otherScript)

local function onViewportChanged(startLine: number, endLine: number)
	print(`Script Viewport Changed - startLine: {startLine}, endLine: {endLine}`)
end
-- Connect the ViewportChanged event to the function above that prints the start and end line of the updated viewport
scriptDocument.ViewportChanged:Connect(onViewportChanged)
