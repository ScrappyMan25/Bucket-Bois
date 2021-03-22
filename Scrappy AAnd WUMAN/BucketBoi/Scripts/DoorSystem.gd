extends ParentDoor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	current_color = colors[TYPE]
	
	pressurePlate = $PressurePlate/AnimatedSprite
	pressurePlate_Lable = $PressurePlate/AnimatedSprite/Label
	animation = $AnimationPlayer
	door = $Door/AnimatedSprite

	pressurePlate.play(current_color)
	door.play(current_color)

	pressurePlate_Lable.text = state_dict[state]
	animation.get_animation("Door").track_set_key_value(0, 0, Vector2($Door.position.x, $Door.position.y))
	animation.get_animation("Door").track_set_key_value(0, 1, Vector2($Door.position.x, $Door.position.y-125))
	pass
