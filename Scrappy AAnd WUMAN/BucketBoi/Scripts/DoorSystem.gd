extends ParentDoor

export var Distance = 125
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	current_color = colors[TYPE]
	
	pressurePlate = $PressurePlate/AnimatedSprite
	pressurePlate_Lable = $PressurePlate/AnimatedSprite/Label
	animation = $AnimationPlayer
	door = $Door/AnimatedSprite
	

	pressurePlate.play("OFF")
	door.play("default")

	pressurePlate_Lable.text = state_dict[state]
	animation.get_animation("Door").track_set_key_value(0, 0, Vector2($Door.position.x, $Door.position.y))
	animation.get_animation("Door").track_set_key_value(0, 1, Vector2($Door.position.x, $Door.position.y-Distance))
	pass

func _process(delta):
	if sound == true && !$DoorSound.playing:
		$DoorSound.play()
		sound = false
		var t : NodePath
		pass
	pass
