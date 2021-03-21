extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_swap_counter(get_node("../PlayerPair").swap_limit)
	pass # Replace with function body.

func update_swap_counter(swap_count : int) -> void:
	$Interface/Counter/LifeCounter/Label.text = swap_count as String
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
