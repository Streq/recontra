extends Area2D




func _on_despawn_zone_body_entered(body: Node) -> void:
	body.queue_free()
