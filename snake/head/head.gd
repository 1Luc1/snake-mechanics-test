extends CharacterBody2D

signal collided_with(collider_name: String)

func update_input_direction(new_input_direction):
	velocity = new_input_direction

func _physics_process(delta):
	#print("head[position]: ", position)
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		emit_signal("collided_with", collision.get_collider_shape().name)
