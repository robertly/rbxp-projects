--!nocheck

-- Run the following code in the Command Bar

local ScriptEditorService = game:GetService("ScriptEditorService")

type Request = {
	position: {
		line: number,
		character: number,
	},
	textDocument: {
		document: ScriptDocument?,
		script: LuaSourceContainer?,
	},
}

type Response = {
	items: {
		{
			label: string,
			kind: Enum.CompletionItemKind?,
			tags: { Enum.CompletionItemTag }?,
			detail: string?,
			documentation: {
				value: string,
			}?,
			overloads: number?,
			learnMoreLink: string?,
			codeSample: string?,
			preselect: boolean?,
			textEdit: {
				newText: string,
				replace: {
					start: { line: number, character: number },
					["end"]: { line: number, character: number },
				},
			}?,
		}
	},
}

local autocompleteCallback = function(request: Request, response: Response): Response
	local item = {
		label = "foo",
		preselect = true,
	}
	table.insert(response.items, item)
	return response
end

ScriptEditorService:RegisterAutocompleteCallback("foo", 1, autocompleteCallback)

-- To deregister the callback, run the following code in the Command Bar

ScriptEditorService:DeregisterAutocompleteCallback("foo")
