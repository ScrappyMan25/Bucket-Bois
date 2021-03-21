extends KinematicBody2D

export (int) var upForce = -30
export (int) var downForce = 600
var appliedForce = 0

var velocity = Vector2.ZERO

signal ray_collided

var playerDetected :  bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	appliedForce = upForce
	pass # Replace with function body.

func _process(delta: float) -> void:
	if $RayCast2D.get_collider():
		if $RayCast2D.get_collider().get("name") == "1" || $RayCast2D.get_collider().get("name") == "2":
#			if  !playerDetected:
#				velocity.y = -2000
			playerDetected = true
		else:
#			if  playerDetected:
#				velocity.y = 0
			playerDetected = false
			pass
	pass

func _physics_process(delta: float) -> void:
	if playerDetected:
		appliedForce = downForce
	else:
		appliedForce = upForce
	velocity.y += appliedForce
	velocity.y = clamp(velocity.y, -1200, 2000)
	move_and_slide(velocity, Vector2.DOWN)
	for i in get_slide_count():
		if (get_slide_collision(i).collider.name == "1" || get_slide_collision(i).collider.name == "2") && !get_slide_collision(i).collider.inBucket:
			get_slide_collision(i).collider.hit()
			pass
	pass

