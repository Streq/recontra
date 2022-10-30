extends Node
signal finished()

export var time_per_char_in_seconds := 0.1

onready var label = get_parent()

func hide():
	label.hide()
	
func display(amount:=-1):
	label.show()
	var full_length = label.get_total_character_count()
	var current_length = label.visible_characters
	var remaining = (0 
		if current_length<0 
		else full_length-current_length
	) 
	if amount >= 0:
		remaining = min(amount,remaining)
	
	var tween = create_tween()
	
	tween.tween_property(
		label, 
		"visible_characters",
		current_length+remaining,
		time_per_char_in_seconds*remaining
	)
	tween.tween_callback(self,"emit_signal",["finished"])



