extends KinematicBody2D


var speed = 200
var run = 350
var jump = 1000
var jump_point = 1
var released_jump = 1
var life = 10
var bullet = preload("res://Scenes/Bullet.tscn")

var velocity = Vector2()

func get_input():
	
	#control vars
	var right_pressed = Input.is_action_pressed("ui_right")
	var left_pressed = Input.is_action_pressed("ui_left")
	var up_just_pressed = Input.is_action_just_pressed("ui_up")
	var up_just_released = Input.is_action_just_released("ui_up")
	var shift_pressed = Input.is_action_pressed("ui_run")
	var shift_just_released = Input.is_action_just_released("ui_run")
	var z_just_pressed = Input.is_action_just_pressed("fire")
	
	velocity.x = 0
	if right_pressed:
		velocity.x += speed
	if left_pressed:
		velocity.x -= speed
	if up_just_pressed:
		if jump_point == 1:
			velocity.y -= jump
			jump_point = 0
	if up_just_released:
		if released_jump == 1:
			velocity.y = 30
			released_jump = 0
	if shift_pressed:
		speed = run
	if shift_just_released:
		speed = 200
	if z_just_pressed:
		var fire = bullet.instance()
		fire.set_position(get_node(".").position)
		fire.position.x += 50
		get_node("../").add_child(fire)

func gravity():
	if is_on_floor():
		jump_point = 1
		released_jump = 1
	else:
		jump_point = 0
		velocity.y += 30

func death():
	if life == 0:
		queue_free()
	else:
		life -= 1

func _physics_process(_delta):
	gravity()
	get_input()
	
	velocity = move_and_slide(velocity, Vector2(0, -1))

func _on_heart_body_entered(_body):
	death()
	print(life)
