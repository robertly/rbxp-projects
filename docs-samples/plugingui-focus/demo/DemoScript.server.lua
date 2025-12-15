local info = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, true, true, 200, 50, 1, 1)

local widget = plugin:CreateDockWidgetPluginGui("TestWidget", info)

local function onFocusReleased()
	widget.Title = "I'm not in focus :("
end

local function onFocused()
	widget.Title = "I'm in focus :D"
end

widget.WindowFocusReleased:Connect(onFocusReleased)

widget.WindowFocused:Connect(onFocused)
