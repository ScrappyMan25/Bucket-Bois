extends Node

var p1
var p2
var p
var scene = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	p1 = $"1"
	p1.focus = true
	p2 = $"2"
	p2.focus = false
	p = $"1"
	scene = get_parent()
	p1.set_deferred("scene",scene)
	p2.set_deferred("scene",scene)
	pass # Replace with function body.

func swap():
	p.focus = false
	if p == p1:
		p = p2
		pass
	else:
		p = p1
		pass
	p.focus = true
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("ui_focus_next"):
		swap()
		pass
	$Camera2D.position = p.position
	pass
