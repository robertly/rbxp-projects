local plugin = plugin or getfenv().PluginManager():CreatePlugin()
plugin.Name = "Plugin"

local function actionTriggered()
	print("Hello world!")
end

local pluginAction = plugin:CreatePluginAction(
	"HelloWorldAction",
	"Hello World",
	"Prints a 'Hello world!'",
	"rbxasset://textures/sparkle.png",
	true
)

pluginAction.Triggered:Connect(actionTriggered)
