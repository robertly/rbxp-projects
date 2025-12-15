local GuiService = game:GetService("GuiService")

local humanoidDescription = Instance.new("HumanoidDescription")
humanoidDescription.HatAccessory = "3339374070"
humanoidDescription.BackAccessory = "3339363671"

GuiService:InspectPlayerFromHumanoidDescription(humanoidDescription, "MyPlayer")
