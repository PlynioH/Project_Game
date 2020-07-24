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
	if Input.is_action_just_pressed("fire"):
		var fire = bullet.instance()
		fire.set_position(get_node(".").position)
		fire.position.x += 50
		get_node("../").add_child(fire)

func gravity():
	if is_on_floor():
		jump_point = 1
		released_jump = 1
	else:
		velocity.y += 30

func death():
	if life == 0:
		$".".queue_free()
	else:
		life -= 1

func _physics_process(_delta):
	gravity()
	get_input()
	
	velocity = move_and_slide(velocity, Vector2(0, -1))

func _on_heart_body_entered(body):
	death()
	print(life)
