extends KinematicBody2D

var velocity = Vector2()

func _physics_process(_delta):
	velocity.x += 120
	velocity = move_and_slide(velocity, Vector2(0, -1))

func _on_Area2D_body_entered(_body):
	queue_free()
