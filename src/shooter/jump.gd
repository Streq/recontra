extends FighterState

# Called during _physics_process
func _physics_update(delta: float):
	var input = root.input_state
	var dir = root.input_state.dir
	
	var dirx = dir.x
	var diry = dir.y
	
	if root.is_on_floor():
		goto("idle")
		return
	if dirx:
		if root.facing_dir != sign(dirx):
			root.turn_around()
	
	if dir.length() < 0.95:
		root.velocity.x = lerp(root.velocity.x, 0.0, root.air_lerp*delta)
	else:
		root.velocity.x = lerp(root.velocity.x, root.run_speed*sign(dirx), root.air_run_lerp*delta)
	
	if root.velocity.y<0.0 and !input.A.is_pressed():
		root.velocity.y *= 0.5
		goto("air")
		return
