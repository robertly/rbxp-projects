local trail = script.Parent

trail.Lifetime = 4

while true do
	task.wait(3)
	trail.MinLength = 10
	task.wait(3)
	trail.MinLength = 0.1
end
