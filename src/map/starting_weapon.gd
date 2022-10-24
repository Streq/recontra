extends Node2D

onready var drop_table: Node = $drop_table

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var drop = drop_table.get_spawn()
	if drop:
		get_parent().call_deferred("add_child",drop.instance())
