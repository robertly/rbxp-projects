--!nocheck

-- Run the following code in the Command Bar

local ScriptEditorService = game:GetService("ScriptEditorService")

local documents = ScriptEditorService:GetScriptDocuments()

for _, document in documents do
	if document:IsCommandBar() then
		print("Command bar document:", document)
	end
end
