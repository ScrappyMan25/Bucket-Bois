extends KinematicBody2D

export var speed: = Vector2(300.0, 1000.0)
export var velocity: = Vector2.ZERO
var gravity: = 3000.0
const FLOOR_NORMAL: = Vector2.UP

func _ready() -> void:
	velocity.x = speed.x

func _physics_process(delta:float) -> void:
	velocity.y += gravity * delta
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	pass

func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "1" || body.name == "2":
		if body.inBucket:
			#bounce back
			velocity.x *= -1
			print("bb")
			pass
		else:
			#print
			print("player")
			pass
		pass
	elif body.name == "Bucket":
		#bounce back
		velocity.x *= -1
		print("bb")
		pass
	else:
		#boice back
		print("bb")
		velocity.x *= -1
		pass
	pass # Replace with function body.
