extends ParentDoor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_color = colors[TYPE]
	
	pressurePlate = $HoriPressurePlate/AnimatedSprite
	pressurePlate_Lable = $HoriPressurePlate/AnimatedSprite/Label
	animation = $AnimationPlayer2
	door = $HorizontalDoor/AnimatedSprite
	
	pressurePlate.play(current_color)
	door.play(current_color)
	
	pressurePlate_Lable.text = state_dict[state]
	animation.get_animation("Door").track_set_key_value(0, 0, Vector2($HorizontalDoor.position.x, $HorizontalDoor.position.y))
	animation.get_animation("Door").track_set_key_value(0, 1, Vector2($HorizontalDoor.position.x+125, $HorizontalDoor.position.y))
	pass
