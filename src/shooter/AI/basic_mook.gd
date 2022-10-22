extends Node

export var dir := Vector2()
func _physics_process(delta: float) -> void:
	var input = get_parent().input_state
	input.B.pressed = !input.B.pressed
	input.dir = dir


#	var input = get_parent().input_state
#	input.A.pressed = Input.is_action_pressed("A")
#	input.B.pressed = Input.is_action_pressed("B")
##	input.dir.x = Input.get_axis("ui_left","ui_right")
##	input.dir.y = Input.get_axis("ui_up","ui_down")
#	input.dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
