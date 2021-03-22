extends ParentDoor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressurePlate = $HoriPressurePlate/AnimatedSprite
	pressurePlate_Lable = $HoriPressurePlate/AnimatedSprite/Label
	animation = $AnimationPlayer2
	door = $HorizontalDoor/AnimatedSprite
	pressurePlate.play("Green")
	door.play("Green")
	pressurePlate_Lable.text = state_dict[state]
	$HorizontalDoor.visible = !state
	$HorizontalDoor/CollisionShape2D.disabled = state
	animation.get_animation("Door").track_set_key_value(0, 0, Vector2($HorizontalDoor.position.x, $HorizontalDoor.position.y))
	animation.get_animation("Door").track_set_key_value(0, 1, Vector2($HorizontalDoor.position.x+125, $HorizontalDoor.position.y))
	pass
func _process(_delta: float) -> void:
	if current_color != colors[TYPE]:
		PressurePlate_Door_type()
		pass
	pass
