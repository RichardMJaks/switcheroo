extends PlayerState

@export var idle: PlayerState
@export var dash_duration: float
@export var hurtbox_collider: CollisionShape2D
var spent_duration: float = 0
var dir: Vector2

var afterimage_delta: float = 0

func enter() -> void:
	super()
	spent_duration = 0
	dir = input_handler.movement_direction
	if not dir:
		dir = Vector2.RIGHT
		
	player.velocity = dir * (StatsUtil.dash_length / dash_duration)
	hurtbox_collider.disabled = true

func exit() -> void:
	hurtbox_collider.disabled = false
	spent_duration = 0
	
func update(delta: float) -> void:
	afterimage_delta += delta
	if afterimage_delta > dash_duration / 10:
		var afterimage = player.sprite.duplicate()
		afterimage.remove_child(afterimage.get_child(0))
		get_tree().current_scene.add_child(afterimage)
		afterimage.global_position = player.global_position
		var tween = afterimage.create_tween()
		tween.tween_property(afterimage, "modulate:a", 0, dash_duration * 2)\
			.set_trans(Tween.TRANS_LINEAR)
		tween.tween_callback(afterimage.queue_free)
		afterimage_delta = 0

func physics_update(delta: float) -> void:
	spent_duration += delta
	if spent_duration > dash_duration:
		change_state.emit(self, idle)
