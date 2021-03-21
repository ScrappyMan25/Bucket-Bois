extends EnemyModel

func _ready() -> void:
	velocity.x = speed.x
	pass

func _physics_process(delta:float) -> void:
	velocity.y += gravity * delta
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	pass

func _process(delta: float) -> void:
	pass

func _on_Area2D_body_entered(body: Node) -> void:
	if (body.name == "1" || body.name == "2") && !body.inBucket:
		#print
		body.hit()
		pass
	else:
		#boice back
		velocity.x *= -1
		pass
	pass # Replace with function body.


func _on_Area2D_area_entered(area: Area2D) -> void:
	if "Barrier" in area.name:
		velocity.x *= -1
	pass # Replace with function body.
