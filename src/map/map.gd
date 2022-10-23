extends Node2D
onready var win_anim: AnimationPlayer = $win_anim
onready var time_left: Timer = $time_left
onready var spawner_timer: Timer = $spawner/Timer
onready var lose_anim: AnimationPlayer = $lose_anim
onready var consigna_label: Label = $CanvasLayer2/consigna_label

func lose():
	consigna_label.visible = false
	time_left.paused = true
	lose_anim.play("play")
	pass

func win():
	consigna_label.visible = false
	win_anim.play("play")
	spawner_timer.paused = true
	get_tree().call_group("enemy","die")
	pass


func _on_time_left_timeout() -> void:
	win()


func _on_soldier_die() -> void:
	lose()

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.scancode == KEY_K:
			lose()
