extends PointLight2D


func _process(_delta: float) -> void:
	scale = Vector2.ONE * 2 * (StatsUtil.vision_range/10)
