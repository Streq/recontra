extends Node

enum {
	WIN = 1,
	LOSE = 2,
	QUIT = 0
}

func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_action("ui_cancel") and event.is_pressed():
		quit()

func win():
	if OS.has_feature("playjam"):
		get_tree().quit(WIN)
	else:
		GlobalPalette.reload()
		get_tree().reload_current_scene()
		
func lose():
	if OS.has_feature("playjam"):
		get_tree().quit(LOSE)
	else:
		GlobalPalette.reload()
		get_tree().reload_current_scene()
func quit():
	if OS.has_feature("playjam"):
		get_tree().quit(QUIT)
	else:
		Global.change_fullscreen()
