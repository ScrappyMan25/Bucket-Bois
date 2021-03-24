extends Area2D

var Player : String

func _on_FinishDetector_body_entered(body: Node) -> void:
	if body.name == Player:
		body.finish = !body.finish
		if body.get_parent().check_finish():
			find_parent("LevelManager").next_Level()
		pass
	pass # Replace with function body.


func _on_FinishDetector_body_exited(body: Node) -> void:
	if body.name == Player:
		body.finish = !body.finish
		pass
	pass # Replace with function body.
