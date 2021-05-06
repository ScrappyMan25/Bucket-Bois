extends Node

export (PackedScene) var level
var currentScene
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentScene = level
	add_child(currentScene.instance())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_R):
		get_child(0).queue_free()
		add_child(currentScene.instance())
	pass
