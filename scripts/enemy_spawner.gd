extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var spawn_positions = $SpawnPositions
@onready var spawn_positions_array = spawn_positions.get_children()

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	var random_spawn_position = spawn_positions_array.pick_random()
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.global_position = random_spawn_position.global_position
