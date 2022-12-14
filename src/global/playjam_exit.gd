extends Node

onready var restart_rect: ColorRect = $restart_rect

enum {
	WIN = 1,
	LOSE = 2,
	QUIT = 0
}

func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_action("ui_cancel") and event.is_pressed():
		quit()

func win():
	if Global.is_playjam():
		get_tree().quit(WIN)
	else:
		restart()

func lose():
	if Global.is_playjam():
		get_tree().quit(LOSE)
	else:
		restart()

func quit():
	if Global.is_playjam():
		get_tree().quit(QUIT)
	else:
		OS.window_fullscreen = false
func restart():
	restart_rect.visible = true
	yield(get_tree().create_timer(1.0),"timeout")
	GlobalPalette.reload()
	restart_rect.visible = false
	get_tree().reload_current_scene()
