extends Node

var level : Array = [
	preload("res://Scenes/test.tscn"),
	preload("res://Levels/Template_Level.tscn")
]
var currentScene
var l : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	todo - auto add levels to the level Array *HERE*
	currentScene = level[l]
	var temp = currentScene.instance() 
	temp.name = "CurrentLevel"
	add_child(temp)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_R):
		reset()
		pass
	if Input.is_action_just_released("ui_page_down"):
		next_Level()
	if Input.is_action_just_released("ui_page_up"):
		prev_Level()
	pass

func reset():
	get_child(0).queue_free()
	add_child(currentScene.instance())
	pass

func next_Level():
	# TODO - Set a cundiotion to check array. Level. Lenth before trying to do l++
	l += 1
	currentScene = level[l]
	var temp = currentScene.instance() 
	temp.name = "CurrentLevel"
	get_child(0).queue_free()
	add_child(temp)
	pass

func prev_Level():
	l -= 1
	currentScene = level[l]
	var temp = currentScene.instance() 
	temp.name = "CurrentLevel"
	get_child(0).queue_free()
	add_child(temp)
	pass
