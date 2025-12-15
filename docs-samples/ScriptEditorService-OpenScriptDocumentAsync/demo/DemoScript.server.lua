--!nocheck

-- Run the following code in the Command Bar

local ScriptEditorService = game:GetService("ScriptEditorService")
local Workspace = game:GetService("Workspace")

local newScript = Instance.new("Script")
newScript.Parent = Workspace

local success, err = ScriptEditorService:OpenScriptDocumentAsync(newScript)
if success then
	print("Opened script document")
else
	print(`Failed to open script document: {err}`)
end
