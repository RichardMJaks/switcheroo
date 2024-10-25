extends PointLight2D


func _process(_delta: float) -> void:
	scale = Vector2.ONE * (StatsUtil.vision_range/5)
