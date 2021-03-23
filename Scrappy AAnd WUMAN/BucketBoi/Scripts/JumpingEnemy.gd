extends EnemyModel

func _physics_process(delta:float) -> void:
	velocity.y += gravity * delta
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	if is_on_floor():
		velocity.y = JUMP_HEIGHT
		pass
#	Player collision Detection - SHyam
	for i in get_slide_count():
			if (get_slide_collision(i).collider.name == "1" || get_slide_collision(i).collider.name == "2") && !get_slide_collision(i).collider.inBucket:
				get_slide_collision(i).collider.hit()
				pass
	pass
