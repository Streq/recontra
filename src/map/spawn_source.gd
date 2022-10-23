extends Node

var total_weight
signal pre_spawn()

func refresh_weight():
	total_weight = 0
	for spawn in get_children():
		total_weight += spawn.weight
	
func _ready():
	refresh_weight()
	pass
#	refresh()
#	connect("child_entered_tree",self,"_on_child_entered")
#	connect("child_exiting_tree",self,"_on_child_exiting")

#func _on_child_entered(child):
#	refresh()
#func _on_child_exiting(child):
#	refresh()
func get_spawn():
	emit_signal("pre_spawn")
	refresh_weight()
	if !total_weight:
		return null
	var r = rand_range(0,total_weight)
#	print(r)
	for spawn in get_children():
		if !spawn.weight: 
#			print("no chance")
			continue
		if spawn.weight >= r:
			return spawn.scene
		r -= spawn.weight
	
