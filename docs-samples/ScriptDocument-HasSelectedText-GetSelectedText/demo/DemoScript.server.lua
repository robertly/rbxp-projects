--!nocheck

-- Run the following code in the Command Bar while a script is open

local ScriptEditorService = game:GetService("ScriptEditorService")

local function getFirstOpenDocument()
	local documents = ScriptEditorService:GetScriptDocuments()
	for _, document in documents do
		if not document:IsCommandBar() then
			return document
		end
	end
	return nil
end

local scriptDocument = getFirstOpenDocument()

if scriptDocument then
	scriptDocument.SelectionChanged:Connect(function()
		if scriptDocument:HasSelectedText() then
			local selectedText = scriptDocument:GetSelectedText()
			print(`Currently selected text: {selectedText}`)
		else
			print("No text currently selected")
		end
	end)
else
	print("No scripts open")
end
