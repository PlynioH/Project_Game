extends KinematicBody2D


var speed = 200
var run = 350
var jump = 1000
var jump_point = 1
var released_jump = 1

var velocity = Vector2()

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_just_pressed("ui_up"):
		if jump_point == 1:
			velocity.y -= jump
			jump_point = 0
	if Input.is_action_just_released("ui_up"):
		if released_jump == 1:
			velocity.y = 30
			released_jump = 0
	if Input.is_action_pressed("ui_run"):
		speed = run
	if Input.is_action_just_released("ui_run"):
		speed = 200
	if Input.is_action_just_pressed("reload"):
		get_tree().reload_current_scene()

func gravity():
	if is_on_floor():
		jump_point = 1
		released_jump = 1
	else:
		velocity.y += 30

func _physics_process(_delta):
	gravity()
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
