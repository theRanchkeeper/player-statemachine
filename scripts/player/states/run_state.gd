#run state
extends BaseState

func enter():
	.enter()
	print("running state")


func exit():
	.exit()
	print("exiting state")

	
func update(delta : float) -> void :
	
	if _movement() == Vector2.ZERO:
		if target.velocity == Vector2.ZERO:
			emit_signal("switch_to","IDLE")

		if !Input.is_action_pressed("RUN"):
			emit_signal("switch_to","WALKING")
func physics_update(delta : float) -> void :
	
	target.velocity = _movement()
	target.velocity = target.move_and_slide(target.velocity * 
			(target.max_speed + target.sprint))

func input(event: InputEvent) -> void:
	pass
	
	
	
func _movement() -> Vector2:
	
	var dir : Vector2 = Vector2.ZERO
	
	dir.y = Input.get_action_strength("DOWN") - Input.get_action_strength("UP")
	dir.x = Input.get_action_strength("RIGHT") - Input.get_action_strength("LEFT")
	
	return dir.normalized()
