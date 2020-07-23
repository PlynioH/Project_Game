extends KinematicBody2D


var speed = 200
var run = 350

var velocity = Vector2()

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_run"):
		speed = run
	if Input.is_action_just_released("ui_run"):
		speed = 200
		
func gravity():
	if is_on_floor():
		pass
	else:
		velocity.y += 30

func _physics_process(_delta):
	gravity()
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
