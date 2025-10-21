extends Node2D

@onready var gemScene = preload("res://gem/gem.tscn")

func _ready() -> void:
	add_gem()

func add_gem():
	var gem = gemScene.instantiate()
	gem.position = Vector2((randi() % (1152-64)) + 64, (randi() % (648-64)) + 64)
	gem.connect("gem_collected", Callable(self, "spawn_next_gem"))
	call_deferred("add_child", gem)

func spawn_next_gem():
	add_gem()
	get_node("Snake").add_limb()
