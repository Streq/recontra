extends Node

var base_bg = []
var base_obj = []

export var delay_obj_bg := 0.2
export var fade_in_step_time := 1.0
export var fade_out_step_time := 1.0
	
func fade_in():
	
	fade_in_obj()
	yield(get_tree().create_timer(delay_obj_bg),"timeout")
	fade_in_bg()
	
func fade_in_bg():
	var background_palettes = GlobalPalette.background_palettes
	for n in 3:
		yield(get_tree().create_timer(fade_in_step_time),"timeout")
		for i in background_palettes.size():
			var background_palette : Palette = background_palettes[i]
			var shift_color = PoolColorArray([base_bg[i][2-n]])
			background_palette.palette = ColorUtils.shift_palette_right(
					background_palette.palette, 
					shift_color
				)[0]

func fade_in_obj():
	var object_palettes = GlobalPalette.object_palettes
	for n in 3:
		yield(get_tree().create_timer(fade_in_step_time),"timeout")
		for i in object_palettes.size():
			var object_palette : Palette = object_palettes[i]
			var shift_color = PoolColorArray([base_obj[i][2-n]])
			object_palette.palette = ColorUtils.shift_palette_right(
					object_palette.palette, 
					shift_color
				)[0]
	
func fade_out():
	fade_out_bg()
	yield(get_tree().create_timer(delay_obj_bg),"timeout")
	fade_out_obj()

func fade_out_bg():
	var black = PoolColorArray([Color.black])
	for i in 4:
		yield(get_tree().create_timer(fade_out_step_time),"timeout")
		for palette in GlobalPalette.background_palettes:
			var p : Palette = palette
			p.palette = ColorUtils.shift_palette_left(p.palette, black)[0]
	

func fade_out_obj():
	var black = PoolColorArray([Color.black])
	for i in 4:
		yield(get_tree().create_timer(fade_out_step_time),"timeout")
		for palette in GlobalPalette.object_palettes:
			var p : Palette = palette
			p.palette = ColorUtils.shift_palette_left(p.palette, black)[0]
	
	pass

func blackout():
	var black3 = PoolColorArray([Color.black,Color.black,Color.black])
	var background_palettes = GlobalPalette.background_palettes
	
	
	#blacken the whole thing
	for i in background_palettes.size():
		var background_palette : Palette = background_palettes[i]
		var shift = ColorUtils.shift_palette_left(background_palette.palette, black3)
		background_palette.palette = shift[0]
		#store the original colors in base_bg
		base_bg.append(shift[1])
	
	var object_palettes = GlobalPalette.object_palettes
	
	#blacken the whole thing
	for i in object_palettes.size():
		var object_palette : Palette = object_palettes[i]
		var shift = ColorUtils.shift_palette_left(object_palette.palette, black3)
		object_palette.palette = shift[0]
		#store the original colors in base_obj
		base_obj.append(shift[1])

func _ready() -> void:
	blackout()
