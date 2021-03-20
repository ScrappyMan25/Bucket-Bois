extends KinematicBody2D

export var GRAVITY = 300
export var MX_GRAVITY = 1500
const JUMP_SPEED  = -300.0
var SPEED = 200
var velocity: = Vector2.ZERO

var inBucket:bool = false
var focus : bool = true
var playerInBucketRange = false

var bucket = null
var scene = null
var bucket_asset = preload("res://Scenes/Bocket.tscn")

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if velocity.y > MX_GRAVITY:
		velocity.y = MX_GRAVITY
	if is_on_floor():
		velocity.y = 0
		if !inBucket && focus:
			if Input.is_action_just_pressed("ui_select"):
				velocity.y = JUMP_SPEED
	
	if focus:
		get_input()
	else:
		velocity.x = 0
	move_and_slide(velocity, Vector2(0,-1))
	pass

func get_input():
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		pass
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		pass
	else:
		velocity.x = 0
	
	if Input.is_action_just_released("ui_accept"):
		swap_bucket()
		pass
	pass

func swap_bucket():
	#set sprite
	var temp : String
	if inBucket:
	#become bicket
		temp = "2"
		scale = Vector2(scale.x/2, scale.y/2)
	#spawn buck
		bucket = bucket_asset.instance()
		bucket.position = Vector2(self.position.x+5, self.position.y)
		scene.add_child(bucket)
		bucket = null
		inBucket = !inBucket
		SPEED = 200
		pass
	elif !inBucket && playerInBucketRange:
		#despawn bucket
		temp = "1"
		scale = Vector2(scale.x*2, scale.y*2)
		if bucket != null:
			bucket.queue_free()
		#become a thing
		inBucket = !inBucket
		SPEED = 80
	$AnimatedSprite.play(temp)
	pass
