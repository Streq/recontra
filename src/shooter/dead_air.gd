extends FighterState

func _physics_update(delta: float):
	if root.is_on_floor():
		goto("dead")
		return
	root.velocity.x = lerp(root.velocity.x, 0.0, root.air_dead_lerp*delta)
