extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_FinishDetector_body_entered(body: Node) -> void:
	if body.name == "1" || body.name == "2":
		body.finish = !body.finish
		if body.get_parent().check_finish():
			find_parent("LevelManager").next_Level()
		pass
	pass # Replace with function body.


func _on_FinishDetector_body_exited(body: Node) -> void:
	if body.name == "1" || body.name == "2":
		body.finish = !body.finish
		pass
	pass # Replace with function body.
