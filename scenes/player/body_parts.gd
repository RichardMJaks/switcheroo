extends Node
class_name BodyPartsHandler

@onready var body_parts: Dictionary = {
	Util.BODY_TYPE.HEAD: $Head,
	Util.BODY_TYPE.TORSO: $Torso,
	Util.BODY_TYPE.MAINHAND: $MainHand,
	Util.BODY_TYPE.OFFHAND: $"OffHand",
	Util.BODY_TYPE.LEFTLEG: $LeftLeg,
	Util.BODY_TYPE.RIGHTLEG: $RightLeg,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is BodyPart:
			var type = child.type
			if body_parts[type]:
				remove_child(child)
				child.queue_free()
				return
			body_parts[type] = child

# We need to constantly check stats because body parts can rot
func _physics_process(_delta: float) -> void:
	_recalculate_stats()

func _recalculate_stats():
	StatsUtil.stats.resedt_stats()
	_get_stats()

func change_body_part(type: Util.BODY_TYPE, new_part: BodyPart) -> void:
	var old_part = body_parts[type]
	if old_part:
		remove_child(old_part)
		old_part.queue_free()
		body_parts[type] = null
	
	if new_part:
		if new_part.type != type:
			push_error("BodyPart type does not match with given type!")
			return
		body_parts[type] = new_part
		add_child(new_part, true)

func _get_stats():
	for part: BodyPart in body_parts.values():
		if part:
			part.modify_stats(StatsUtil.stats)
	
