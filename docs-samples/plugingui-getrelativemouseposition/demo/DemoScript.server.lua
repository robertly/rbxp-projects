local RunService = game:GetService("RunService")

local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	true,
	false, -- Enabled state, override
	200,
	300, -- Size
	150,
	150 -- Minimum size
)

local testWidget = plugin:CreateDockWidgetPluginGui("TestWidget", widgetInfo)

function update()
	local v2 = testWidget:GetRelativeMousePosition()
	testWidget.Title = ("(%d, %d)"):format(v2.x, v2.y)
end

RunService.Stepped:Connect(update)

update()
