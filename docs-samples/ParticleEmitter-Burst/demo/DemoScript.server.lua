local emitter = script.Parent
while true do
	emitter:Clear()
	emitter:Emit(10)
	task.wait(2)
end
