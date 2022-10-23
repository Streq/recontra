extends Label


export var timer_path: NodePath


onready var timer : Timer = get_node(timer_path)

func _process(delta: float) -> void:
	text="SOBREVIVI %02d SEGUNDOS" % timer.time_left
