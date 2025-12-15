local object = script.Parent

local function onChanged(property)
	-- Get the current value of the property
	local value = object[property]
	-- Print a message saying what changed
	print(object:GetFullName() .. "." .. property .. " (" .. typeof(value) .. ") changed to " .. tostring(value))
end

object.Changed:Connect(onChanged)
-- Trigger a simple change in the object (add an underscore to the name)
object.Name = "_" .. object.Name
