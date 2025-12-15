local PhysicsService = game:GetService("PhysicsService")

local collisionGroupBall = "CollisionGroupBall"
local collisionGroupDoor = "CollisionGroupDoor"

-- Register collision groups
PhysicsService:RegisterCollisionGroup(collisionGroupBall)
PhysicsService:RegisterCollisionGroup(collisionGroupDoor)

-- Assign parts to collision groups
script.Parent.BallPart.CollisionGroup = collisionGroupBall
script.Parent.DoorPart.CollisionGroup = collisionGroupDoor

-- Set groups as non-collidable with each other and check the result
PhysicsService:CollisionGroupSetCollidable(collisionGroupBall, collisionGroupDoor, false)
print(PhysicsService:CollisionGroupsAreCollidable(collisionGroupBall, collisionGroupDoor)) --> false
