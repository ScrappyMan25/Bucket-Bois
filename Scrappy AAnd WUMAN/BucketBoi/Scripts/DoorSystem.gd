extends Node

enum types{Green = 0, Blue = 1 , Red = 2}
export(types) var TYPE

const colors  = ["Green", "Blue", "Red"]


var current_color:String = "Green"

var state_dict: Dictionary = {false:"OFF", true: "ON"}
var state = false

var in_body = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PressurePlate/AnimatedSprite.play("Green")
	$Door/AnimatedSprite.play("Green")
	$PressurePlate/AnimatedSprite/Label.text = state_dict[state]
	$Door.visible = !state
	$Door/CollisionShape2D.disabled = state
	pass
func _process(_delta: float) -> void:
	if current_color != colors[TYPE]:
		PressurePlate_Door_type()
		pass
	pass

func PressurePlate_Door_type():
	current_color = colors[TYPE]
	$PressurePlate/AnimatedSprite.play(current_color)
	$Door/AnimatedSprite.play(current_color)
	pass

func _on_PressurePlate_body_entered(_body: Node) -> void:
	if ((_body.name == "1" || _body.name == "2") && _body.inBucket) || _body.name.find("Bucket") > 0:
#		in_body = true
		state = true
		$PressurePlate/AnimatedSprite/Label.text = state_dict[state]
		$Door.visible = !state
		$Door/CollisionShape2D.set_deferred("disabled", state)
	pass 


func _on_PressurePlate_body_exited(_body: Node) -> void:
	if ((_body.name == "1" || _body.name == "2") && _body.inBucket) || _body.name.find("Bucket") >0:
		state = false
		$PressurePlate/AnimatedSprite/Label.text = state_dict[state]
		$Door.visible = !state
		$Door/CollisionShape2D.set_deferred("disabled", state)
		pass # Replace with function body.

