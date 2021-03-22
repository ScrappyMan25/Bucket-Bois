extends ParentDoor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressurePlate = $PressurePlate/AnimatedSprite
	pressurePlate_Lable = $PressurePlate/AnimatedSprite/Label
	animation = $AnimationPlayer
	door = $Door/AnimatedSprite
	pressurePlate.play("Green")
	door.play("Green")
	pressurePlate_Lable.text = state_dict[state]
	$Door.visible = !state
	$Door/CollisionShape2D.disabled = state
	animation.get_animation("Door").track_set_key_value(0, 0, Vector2($Door.position.x, $Door.position.y))
	animation.get_animation("Door").track_set_key_value(0, 1, Vector2($Door.position.x, $Door.position.y-125))
	pass
func _process(_delta: float) -> void:
	if current_color != colors[TYPE]:
		PressurePlate_Door_type()
		pass
	pass
