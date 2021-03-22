extends Node
class_name ParentDoor

enum types{Green = 0, Blue = 1 , Red = 2}
export(types) var TYPE

const colors  = ["Green", "Blue", "Red"]

onready var pressurePlate #= $PressurePlate/AnimatedSprite
onready var pressurePlate_Lable #= $PressurePlate/AnimatedSprite/Label
onready var animation #= $AnimationPlayer
onready var door #= $Door/AnimatedSprite

var current_color:String = "Green"

var state_dict: Dictionary = {false:"OFF", true: "ON"}
var state = false

var in_body = false

func PressurePlate_Door_type():
	current_color = colors[TYPE]
	pressurePlate.play(current_color)
	door.play(current_color)
	pass

func _on_PressurePlate_body_entered(_body: Node) -> void:
	if ((_body.name == "1" || _body.name == "2") && _body.inBucket) || "Bocket" in _body.name:
#		in_body = true
		state = true
		pressurePlate_Lable.text = state_dict[state]
#		$Door.visible = !state
#		$Door/CollisionShape2D.set_deferred("disabled", state)
		animation.play("Door")
	pass 

func _on_PressurePlate_body_exited(_body: Node) -> void:
	if ((_body.name == "1" || _body.name == "2") && _body.inBucket) || "Bocket" in _body.name:
		print(_body.name)
		state = false
		pressurePlate_Lable.text = state_dict[state]
#		$Door.visible = !state
#		$Door/CollisionShape2D.set_deferred("disabled", state)
		animation.play_backwards("Door")
		pass # Replace with function body.


