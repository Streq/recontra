extends Node2D
signal shoot
signal finished_shooting

export var cooldown := 0.0
onready var _cooldown_timer: Timer = $cooldown
var cooling_down = false
var shooting_muzzles = 0 setget set_shooting_muzzles

func shoot():
	if !cooling_down:
		emit_signal("shoot")
		if cooldown:
			cooling_down = true
			if is_shooting():
				yield(self,"finished_shooting")
			_cooldown_timer.start(cooldown)

func _on_cooldown_timeout() -> void:
	cooling_down = false

func get_world():
	return owner.get_parent()

func get_wearer():
	return owner
func is_shooting():
	return shooting_muzzles>0

func set_shooting_muzzles(val):
	shooting_muzzles = val
	
	if !shooting_muzzles:
		emit_signal("finished_shooting")
	
