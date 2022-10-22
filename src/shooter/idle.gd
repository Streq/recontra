extends FighterState

# Called during _physics_process
func _physics_update(delta: float):
	var input = root.input_state
	var dir = root.input_state.dir
	
	var dirx = dir.x
	var diry = dir.y
	
	if root.is_on_floor():
		if input.A.is_just_pressed():
			if diry>0.5:
				root.global_position.y+=1.0
			else:
				root.velocity.y -= root.jump_speed
				goto("jump")
				return
	else:
		goto("air")
		return
	if dirx:
		if root.facing_dir != sign(dirx):
			root.turn_around()
		if dir.length() > 0.95:
			goto("run")
			return
	root.velocity.x = lerp(root.velocity.x, 0.0, root.idle_lerp*delta)
