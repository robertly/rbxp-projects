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
	-- Get the text on the cursor's current line
	local cursorLine = scriptDocument:GetSelection()
	local lineText = scriptDocument:GetLine(cursorLine)
	-- Force select the entire line of text
	local success, err = scriptDocument:RequestSetSelectionAsync(cursorLine, 1, cursorLine, #lineText + 1)
	if success then
		print("Set selection!")
	else
		print(`Failed to set selection because: {err}`)
	end
else
	print("No scripts open")
end
