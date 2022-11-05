extends BaseState


func enter():
	.enter()
	print("dead state")


func exit():
	.exit()
	print("exiting state")

	
func update(delta : float) -> void :
	pass


func physics_update(delta : float) -> void :
	pass


func input(event: InputEvent) -> void:
	pass
