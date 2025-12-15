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
	local lineCount = scriptDocument:GetLineCount()
	print(`The script has {lineCount} lines!`)
else
	print("No scripts open")
end
