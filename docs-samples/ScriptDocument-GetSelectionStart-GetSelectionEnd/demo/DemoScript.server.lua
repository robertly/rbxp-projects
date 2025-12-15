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
	local startLine, startCharacter = scriptDocument:GetSelectionStart()
	local endLine, endCharacter = scriptDocument:GetSelectionEnd()
	print(`Selection start: Line {startLine}, Char {startCharacter}`)
	print(`Selection end: Line {endLine}, Char {endCharacter}`)
else
	print("No scripts open")
end
