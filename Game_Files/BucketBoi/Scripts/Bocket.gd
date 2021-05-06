extends KinematicBody2D

export var GRAVITY = 300
export var MX_GRAVITY = 1500
var control : bool = false
var player = null
var velocity: Vector2

var topBucket
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	if velocity.y > MX_GRAVITY:
		velocity.y = MX_GRAVITY
	if is_on_floor():
		velocity.y = 0
		GRAVITY = 0
	else:
		GRAVITY = 300
	if control && Input.is_key_pressed(KEY_SHIFT) && !player.inBucket:
		if position.x - player.position.x > 0 :
			#Left of Bucket
			if player.velocity.x < 0:
				#pulling
				player.pullrev = true
				player.pull()
				pass
			else:
				#pushing
				player.pullrev = false
				player.push()
				pass
			pass
		else:
			#Right of Bucket
			if player.velocity.x > 0:
				#pulling
				player.pullrev = true
				player.pull()
				pass
			else:
				#pushing
				player.pullrev = false
				player.push()
				pass
			pass
			pass
		move_and_slide(Vector2(player.velocity.x, velocity.y), Vector2(0,-1))
		pass
	else:
		move_and_slide(velocity, Vector2(0,-1))
		pass
	if topBucket && !topBucket.control:
		topBucket.position.x = position.x
	pass

func _on_Area2D_body_entered(body: Node) -> void:
	if (body.name == "1" || body.name == "2"):
		body.set_deferred("playerInBucketRange",true)
		body.set_deferred("bucket",self)
		control = true
		player = body
		pass
	pass # Replace with function body.

func _on_Area2D_body_exited(body: Node) -> void:
	if (body.name == "1" || body.name == "2"):
		body.set_deferred("playerInBucketRange",false)
		control = false
		player = null
		pass
	pass # Replace with function body.

func _on_Stack_body_entered(body: Node) -> void:
	if "Bocket" in body.name:
		topBucket = body
	pass # Replace with function body.

func _on_Stack_body_exited(body: Node) -> void:
	if "Bocket" in body.name:
		topBucket = null
	pass # Replace with function body.
