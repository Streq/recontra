extends Node

onready var palette := get_parent()

func trigger() -> void:
	return
	var aux = palette.palette[0]
	palette.palette[0] = palette.palette[1]
	palette.palette[1] = aux


func shift_palette_right(
		palette: PoolColorArray,
		input_colors: PoolColorArray
	) -> PoolColorArray:
	input_colors.append_array(palette)
	input_colors.resize(palette.size())
	return input_colors
	
func shift_palette_left(
		palette: PoolColorArray,
		input_colors: PoolColorArray
	) -> PoolColorArray:
	for i in input_colors.size():
		palette.remove(0)
	palette.append_array(input_colors)
	return palette
	
