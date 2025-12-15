-- Put this Script in several kinds of BasePart, like
-- Part, TrussPart, WedgePart, CornerWedgePart, etc.
local part = script.Parent

-- Create a handles object for this part
local handles = Instance.new("Handles")
handles.Adornee = part
handles.Parent = part

-- Manually specify the faces applicable for this handle
handles.Faces = Faces.new(Enum.NormalId.Top, Enum.NormalId.Front, Enum.NormalId.Left)

-- Alternatively, use the faces on which the part can be resized.
-- If part is a TrussPart with only two Size dimensions
-- of length 2, then ResizeableFaces will only have two
-- enabled faces. For other parts, all faces will be enabled.
handles.Faces = part.ResizeableFaces
