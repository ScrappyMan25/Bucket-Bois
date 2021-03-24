extends Area2D

enum types{Player1 = 1, Player2 = 2}
export (types) var Player
var p_string = ["1", "2"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite.play(p_string[Player])
	pass # Replace with function body.



func _on_FinishDetector_body_entered(body: Node) -> void:
	if body.name == p_string[Player]:
		body.finish = !body.finish
		if body.get_parent().check_finish():
			find_parent("LevelManager").next_Level()
		pass
	pass # Replace with function body.


func _on_FinishDetector_body_exited(body: Node) -> void:
	if body.name == p_string[Player]:
		body.finish = !body.finish
		pass
	pass # Replace with function body.
