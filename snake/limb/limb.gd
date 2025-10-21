extends Node2D

var directions: Array[Vector2]
var times: Array[float]
var speed: float
var direction: Vector2

func direction_changed(new_direction: Vector2):
	direction = new_direction

func _process(delta: float) -> void:
	var dir = directions[0]
	position += dir * delta * speed
	times[0] += delta
	if times[0] >= 0:
		times.pop_front()
		directions.pop_front()
	directions.push_back(direction)
	times.push_back(delta)
