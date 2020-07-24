extends KinematicBody2D

var velocity = Vector2()
var life = 10

func gravity():
	if is_on_floor():
		pass
	else:
		velocity.y += 30

func death():
	if life == 0:
		$".".queue_free()
	else:
		life -= 1

func _physics_process(delta):
	gravity()
	velocity = move_and_slide(velocity, Vector2(0, -1))


func _on_skincoli_body_entered(body):
	print("carai")
	print(life)
	death()
