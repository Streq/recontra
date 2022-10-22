extends Node2D


export var velocity := Vector2()
export var drag := 4.0
export var movement_threshold_squared := 100*100
export var knockback := 0.0
export var damage := 1.0
export var team := 0

func _physics_process(delta: float) -> void:
	position += velocity*delta
	velocity *= (1-delta*drag)
	if is_stopped():
		queue_free()
		
func is_stopped():
	return velocity.length_squared() <= movement_threshold_squared
	


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.owner.team != team:
		area._on_hit(self)
		queue_free()
	
func affect(enemy):
	enemy.velocity += knockback*velocity
	enemy.take_damage(damage)
	if velocity.x:
		enemy.facing_dir = -sign(velocity.x)
