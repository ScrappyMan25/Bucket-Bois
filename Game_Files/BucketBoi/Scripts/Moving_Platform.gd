extends Node2D

enum Type {Vertical = 0, Horizontal = 1}
export (Type) var Orientation

export (int) var speed

var temp : Array
var players : Array

func _ready() -> void:
	temp = [
		Vector2(0, speed),
		Vector2(speed, 0)
	]
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	position += temp[Orientation]
	pass

func _physics_process(delta: float) -> void:
	position += temp[Orientation] * delta
	for i in players:
		i.position += temp[Orientation] * delta
		pass
	pass

func _on_Area2D_area_entered(area: Area2D) -> void:
	if "Barrier" in area.name:
		temp[Orientation] *= -1
		pass
	pass # Replace with function body.


func _on_Squish_Detector_body_entered(body: Node) -> void:
	if body.name == "1" || body.name == "2" :
		if body.is_on_floor() && !body.inBucket:
			body.hit()
			pass
	pass # Replace with function body.


func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "1" || body.name == "2":
		players.push_front(body)
		pass
	pass # Replace with function body.


func _on_Area2D_body_exited(body: Node) -> void:
	if body.name == "1" || body.name == "2":
		players.remove(players.find(body))
		pass
	pass # Replace with function body.
