extends KinematicBody2D


func _physics_process(_delta):
	if Input.is_action_just_pressed("reload"):
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
