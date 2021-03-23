extends EnemyModel

var motion = Vector2()
var motion_previous = Vector2()

var hit_the_ground = false

func _physics_process(delta:float) -> void:
	velocity.y += gravity * delta
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	if is_on_floor():
		velocity.y = JUMP_HEIGHT
		pass
	
	motion_previous = motion
	motion = move_and_slide(motion,Vector2.UP,false)
	
	if not is_on_floor():
		hit_the_ground = false
		$AnimatedSprite.scale.y = range_lerp(abs(motion.y),0,abs(JUMP_HEIGHT),0.75,1.75)
		$AnimatedSprite.scale.x = range_lerp(abs(motion.y),0,abs(JUMP_HEIGHT),1.25,0.75)
		pass
	if not hit_the_ground and is_on_floor():
		hit_the_ground = true
		$AnimatedSprite.scale.x = range_lerp(abs(motion_previous.y),0 , abs(1700), 1.2, 2.0)
		$AnimatedSprite.scale.y = range_lerp(abs(motion_previous.y),0 , abs(1700),0.8,0.5)
		pass
	$AnimatedSprite.scale.x = lerp($AnimatedSprite.scale.x, 1, 1 - pow(0.01, delta))
	$AnimatedSprite.scale.y = lerp($AnimatedSprite.scale.y, 1, 1 - pow(0.01, delta))
	
#	Player collision Detection - SHyam
	for i in get_slide_count():
			if (get_slide_collision(i).collider.name == "1" || get_slide_collision(i).collider.name == "2") && !get_slide_collision(i).collider.inBucket:
				get_slide_collision(i).collider.hit()
				pass
	pass
