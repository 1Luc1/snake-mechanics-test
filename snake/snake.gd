extends Node2D

@onready var limb_scene: Resource = preload("res://snake/limb/limb.tscn")
@onready var body: Node2D = $Body
@onready var head: CharacterBody2D = $Head

var speed: float = 250.0
var gap: float = -64.0
var direction: CONST.DIRECTION = CONST.DIRECTION.RIGHT

func _ready():
	body.direction = CONST.DIR2MAP[direction]
	body.speed = speed
	body.directions.push_front(CONST.DIR2MAP[direction])
	body.times.push_front(gap/speed)
	head.velocity = CONST.DIR2MAP[direction] * speed

func add_limb():
	var limb = limb_scene.instantiate()
	limb.position = body.position
	limb.direction = CONST.DIR2MAP[direction]
	limb.speed = speed
	limb.directions = body.directions.duplicate()
	limb.times = body.times.duplicate()
	call_deferred("add_child", limb)
	
	body.position += Vector2(gap,0)
	body.directions.push_front(CONST.DIR2MAP[CONST.DIRECTION.RIGHT])
	body.times.push_front(gap/speed)

func update_move_direction(new_direction):
	direction = new_direction
	head.velocity = CONST.DIR2MAP[direction] * speed
	get_tree().call_group("limb", "direction_changed", CONST.DIR2MAP[direction] )

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_RIGHT and direction != CONST.DIRECTION.LEFT:
			direction = CONST.DIRECTION.RIGHT
		elif event.keycode == KEY_LEFT and direction != CONST.DIRECTION.RIGHT:
			direction = CONST.DIRECTION.LEFT
		elif event.keycode == KEY_DOWN and direction != CONST.DIRECTION.UP:
			direction = CONST.DIRECTION.DOWN
		elif event.keycode == KEY_UP and direction != CONST.DIRECTION.DOWN :
			direction = CONST.DIRECTION.UP
		update_move_direction(direction)

func _on_head_collided_with(collider_name: String) -> void:
	if collider_name == "CollisionShape2DRight":
		direction = CONST.DIRECTION.UP
	elif collider_name == "CollisionShape2DTop":
		direction = CONST.DIRECTION.LEFT
	elif collider_name == "CollisionShape2DLeft":
		direction = CONST.DIRECTION.DOWN
	elif collider_name == "CollisionShape2DBottom":
		direction = CONST.DIRECTION.RIGHT
	update_move_direction(direction)
