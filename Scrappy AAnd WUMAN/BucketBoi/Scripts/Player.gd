extends KinematicBody2D

#Movement Variables
export var GRAVITY = 600
export var MX_GRAVITY = 1500
const JUMP_SPEED  = -300
var SPEED = 200
var velocity = Vector2.ZERO
var finish = false

var focus : bool = true
var inBucket:bool = false
var playerInBucketRange = false

var bucket = null
var scene = null
var bucket_asset = preload("res://Scenes/Bocket.tscn")

func _ready() -> void:
	scale = Vector2(scale.x/2, scale.y/2)
	pass

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	var snap = Vector2.DOWN * 16 if !is_on_floor() else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity, snap, Vector2(0,-1))
	if velocity.y > MX_GRAVITY:
		velocity.y = MX_GRAVITY
	if is_on_floor():
		velocity.y = 0
		if !inBucket && focus:
			if Input.is_action_just_pressed("ui_select"):
				velocity.y = JUMP_SPEED
				$SoundJump.play()
	if focus:
		get_input()
	else:
		velocity.x = 0
		
#	for i in get_slide_count():
#		print(get_slide_collision(i).collider.name)
	pass

func get_input():
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
#		if !$Moving.play():
#			$Moving.play()
		pass
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
#		if !$Moving.play():
#			$Moving.play()
		pass
	else:
		velocity.x = 0
		$Moving.stop()
	
	if Input.is_action_just_released("ui_accept"):
		swap_bucket()
		pass
	pass

func swap_bucket():
	#set sprite
	var temp : String
	if inBucket:
	#become Player
		temp = name
		scale = Vector2(scale.x/2, scale.y/2)
	#spawn buck
		bucket = bucket_asset.instance()
		bucket.position = Vector2(self.position.x+5, self.position.y)
		scene.add_child(bucket)
		bucket = null
		inBucket = !inBucket
		SPEED = 200
		$ToggleBucket.play()
		pass
	elif !inBucket && playerInBucketRange:
		#despawn bucket
		#become Bucekt
		temp = "Bucket"
		scale = Vector2(scale.x*2, scale.y*2)
		if bucket != null:
			bucket.queue_free()
		#become a thing
		inBucket = !inBucket
		SPEED = 80
		$ToggleBucket.play()
	$AnimatedSprite.play(temp)
	pass

func hit():
	print("hit")
	find_parent("LevelManager").reset()
	pass

func finish():
	print("next Level")
	find_parent("Player_Pair").check_finish()
	pass

func set_sprite(sprite):
	$AnimatedSprite.play(sprite)
	pass
