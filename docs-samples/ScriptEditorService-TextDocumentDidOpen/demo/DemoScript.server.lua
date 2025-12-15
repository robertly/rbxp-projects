--!nocheck

-- Run the following code in the Command Bar

local ScriptEditorService = game:GetService("ScriptEditorService")

ScriptEditorService.TextDocumentDidOpen:Connect(function(scriptDocument)
	print("Opened", scriptDocument)
end)
