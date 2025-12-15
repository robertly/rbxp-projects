--!nocheck

-- Run the following code in the Command Bar

local ScriptEditorService = game:GetService("ScriptEditorService")

local scriptDocuments = ScriptEditorService:GetScriptDocuments()
for _, scriptDocument in scriptDocuments do
	-- Prints the name of each script
	if not scriptDocument:IsCommandBar() then
		print(scriptDocument.Name)
	end
end
