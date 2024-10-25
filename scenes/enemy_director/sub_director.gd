extends Node2D

@export var spawn_radius: float = 5

func spawn_wave(time: float) -> void:
	var enemy: PackedScene = Global.enemies.pick_random()
	for i in range(0, floori(time / 60) + 1):
		var e = enemy.instantiate()
		get_tree().current_scene.add_child(e)
		e.global_position = global_position + Vector2.from_angle(randf_range(0, 2*PI)) * randf_range(0, spawn_radius)
