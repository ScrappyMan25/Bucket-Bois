extends KinematicBody2D

export var speed: = Vector2(300.0, 1000.0)
export var velocity: = Vector2.ZERO
var gravity: = 3000.0
const FLOOR_NORMAL: = Vector2.UP

func _ready() -> void:
	velocity.x = -speed.x

func _physics_process(delta:float) -> void:
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
