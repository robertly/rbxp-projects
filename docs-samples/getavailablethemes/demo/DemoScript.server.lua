local themes = settings().Studio:GetAvailableThemes()

for _, theme in pairs(themes) do
	print(theme)
end
