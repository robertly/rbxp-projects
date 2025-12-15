local Players = game:GetService("Players")

local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

local function onChildRemoved(child)
	print(child.ClassName, "removed from character")
end

character.ChildRemoved:Connect(onChildRemoved)

player:ClearCharacterAppearance()
--> BodyColors removed from character
--> ShirtGraphic removed from character
--> Shirt removed from character
--> Pants removed from character
--> CharacterMesh removed from character
--> Hat removed from character
--> Shirt removed from character
