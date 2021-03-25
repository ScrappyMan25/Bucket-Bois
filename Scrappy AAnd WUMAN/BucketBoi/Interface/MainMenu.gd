extends MarginContainer

const first_scene = preload("res://Levels/Level_1.tscn")

onready var selector_one = $CenterContainer/HBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_two = $CenterContainer/HBoxContainer/CenterContainer2/HBoxContainer/Selector

var current_selector = 0

func _ready():
	set_current_selection(0)
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_right") and current_selector < 1:
		current_selector += 1
		set_current_selection(current_selector)
	elif Input.is_action_just_pressed("ui_left") and current_selector > 0:
		current_selector -= 1
		set_current_selection(current_selector)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selector)
	pass

func handle_selection(_current_selector):
	if _current_selector == 0:
		get_parent().add_child(first_scene.instance())
		queue_free()
	elif _current_selector == 1:
		get_tree().quit()
	pass
	
	
func set_current_selection(_current_selector):
	selector_one.text = ""
	selector_two.text = ""
	if _current_selector == 0:
		selector_one.text = ">"
	elif _current_selector == 1:
		selector_two.text = ">"
	pass
