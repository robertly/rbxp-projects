--!nocheck

-- Run the following code in the Command Bar

local ScriptEditorService = game:GetService("ScriptEditorService")

ScriptEditorService.TextDocumentDidChange:Connect(function(scriptDocument, changes)
	print("Changed", scriptDocument, changes)
end)
