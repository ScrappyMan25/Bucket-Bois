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
var sound = false
var sound2 = false

func _on_PressurePlate_body_entered(_body: Node) -> void:
	if ((_body.name == "1" || _body.name == "2") && _body.inBucket) || "Bocket" in _body.name:
		state = true
		pressurePlate_Lable.text = state_dict[state]
		sound = true
		animation.play("Door")
	pass 

func _on_PressurePlate_body_exited(_body: Node) -> void:
	if ((_body.name == "1" || _body.name == "2") && _body.inBucket) || "Bocket" in _body.name:
		print(_body.name)
		state = false
		pressurePlate_Lable.text = state_dict[state]
		sound2 = true
		animation.play_backwards("Door")
		pass
	pass

