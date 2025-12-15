--!nocheck

-- Run the following code in the Command Bar

local ScriptEditorService = game:GetService("ScriptEditorService")

local documents = ScriptEditorService:GetScriptDocuments()
local scriptDocument
-- Find the first open script document
for _, document in documents do
	-- The Command Bar can't be closed, so don't select it
	if not document:IsCommandBar() then
		scriptDocument = document
		break
	end
end

if scriptDocument then
	local success, err = scriptDocument:CloseAsync()
	if success then
		print(`Closed {scriptDocument.Name}`)
	else
		warn(`Failed to close {scriptDocument.Name} because: {err}`)
	end
else
	print("No open scripts")
end
