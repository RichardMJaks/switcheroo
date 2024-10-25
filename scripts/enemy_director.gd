extends Node2D

@export var sub_director: PackedScene
var sub_directors: Array[Node2D] = []
var time_elapsed: float = 0
var min_spawn_distance: float = 10
var max_spawn_distance: float = 15

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elapsed += delta
	
	if sub_directors.size() - 1 < floori(time_elapsed / 30):
		var sd = sub_director.instantiate()
		add_child(sd)
		sub_directors.append(sd)

func _physics_process(delta: float) -> void:
	if Global.player:
		global_position = Global.player.global_position

func _on_timer_timeout() -> void:
	for sd in sub_directors:
		sd.global_position =\
			global_position\
			+ Vector2.from_angle(randf_range(0, PI*2))\
			* randf_range(min_spawn_distance, max_spawn_distance)
		sd.spawn_wave(time_elapsed)
