extends Node

onready var palette := get_parent()

func trigger() -> void:
	return
	var aux = palette.palette[0]
	palette.palette[0] = palette.palette[1]
	palette.palette[1] = aux


