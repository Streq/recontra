extends Node2D

var gun = null

func _ready() -> void:
	if get_child_count():
		self.gun = get_child(0)
		connect("shoot", gun, "shoot")


func add_gun(gun:Node):
	add_child(gun)
	self.gun = gun
	gun.owner = owner
	connect("shoot", gun, "shoot")
	
func remove_gun():
	if gun:
		remove_child(gun)
		disconnect("shoot", gun, "shoot")
		gun.queue_free()
		gun = null

func press_trigger():
	if gun:
		gun.press_trigger()
func release_trigger():
	if gun:
		gun.release_trigger()
