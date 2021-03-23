extends ParentDoor
# Called when the node enters the scene tree for the first time.
export var Distance = 125

enum Type {VerticalMovement = 0, HorizontalMovement = 1}
export (Type) var Orientation
var stopMove = false
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
	if Orientation == 1 && stopMove == false:	
		animation.get_animation("Door").track_set_key_value(0, 1, Vector2($HorizontalDoor.position.x+Distance, $HorizontalDoor.position.y))
		pass
	if Orientation == 0 && stopMove == false:
		animation.get_animation("Door").track_set_key_value(0, 1, Vector2($HorizontalDoor.position.x, $HorizontalDoor.position.y-Distance))
		pass
	pass

func _on_Area2D_area_entered(area: Area2D) -> void:
	if "Bocket" in area.name:
		stopMove = true
		pass
	pass  
