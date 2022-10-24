extends Node2D
signal shoot

var gun = null

func _ready() -> void:
	if get_child_count():
		self.gun = get_child(0)
		connect("shoot", gun, "shoot")

func shoot():
	emit_signal("shoot")

func add_gun(gun:Node):
	add_child(gun)
	self.gun = gun
	gun.owner = owner
	connect("shoot", gun, "shoot")
	
func remove_gun():
	remove_child(gun)
	disconnect("shoot", gun, "shoot")
	gun.queue_free()
	gun = null
