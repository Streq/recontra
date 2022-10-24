extends Node2D
signal picked_up()
onready var effect: Node = $effect
onready var player_detect: Area2D = $player_detect
onready var lifetime: Timer = $lifetime

var applied_already = false

func _on_player_detect_body_entered(body: Node) -> void:
	if applied_already:
		return
	applied_already = true
	effect.apply(body)
	emit_signal("picked_up")
	queue_free()
	

