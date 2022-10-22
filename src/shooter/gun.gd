extends Node2D
signal shoot

export var cooldown := 0.0
onready var _cooldown_timer: Timer = $cooldown
var cooling_down = false


func shoot():
	if !cooling_down:
		emit_signal("shoot")
		if cooldown:
			cooling_down = true
			_cooldown_timer.start(cooldown)

func _on_cooldown_timeout() -> void:
	cooling_down = false

func get_world():
	return owner.get_parent()

func get_wearer():
	return owner
