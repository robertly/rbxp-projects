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
	scriptDocument.SelectionChanged:Connect(function(positionLine, positionCharacter, anchorLine, anchorCharacter)
		print(`Selected: Line {positionLine}, Char {positionCharacter}`)
		print(`Anchor: Line {anchorLine}, Char {anchorCharacter}`)
		local lineText = scriptDocument:GetLine(positionLine)
		print(`Selected line text: {lineText}`)
	end)
else
	print("No scripts open")
end
