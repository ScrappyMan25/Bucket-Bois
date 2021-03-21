extends EnemyModel

func _physics_process(delta:float) -> void:
	velocity.y += gravity * delta
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	if is_on_floor():
		velocity.y = JUMP_HEIGHT
	pass
