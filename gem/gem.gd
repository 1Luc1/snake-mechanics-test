extends Area2D

signal gem_collected

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Head":
		queue_free()
		emit_signal("gem_collected")
