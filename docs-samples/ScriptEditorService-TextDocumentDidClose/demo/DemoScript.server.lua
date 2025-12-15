--!nocheck

-- Run the following code in the Command Bar

local ScriptEditorService = game:GetService("ScriptEditorService")

ScriptEditorService.TextDocumentDidClose:Connect(function(scriptDocument)
	print("Closed", scriptDocument)
end)
