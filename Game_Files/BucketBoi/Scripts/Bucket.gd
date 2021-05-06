extends RigidBody2D

export var GRAVITY = 300
export var MX_GRAVITY = 1500

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	linear_velocity.y += GRAVITY * delta
	if linear_velocity.y > MX_GRAVITY:
		linear_velocity.y = MX_GRAVITY
	pass

func _on_Area2D_body_entered(body: Node) -> void:
	body.set_deferred("playerInBucketRange",true)
	body.set_deferred("bucket",self)
	print("InRange")
	pass # Replace with function body.

func _on_Area2D_body_exited(body: Node) -> void:
	body.set_deferred("playerInBucketRange",false)
	#body.set_deferred("bucket",null)
	print("OutRange")
	pass # Replace with function body.
