extends KinematicBody2D

var mousein = false

func _ready():
	pass 

func _physics_process(_delta):
	if mousein == true:
		$".".position = get_global_mouse_position()

func _on_toque_pressed():
	mousein = true

func _on_toque_released():
	mousein = false
