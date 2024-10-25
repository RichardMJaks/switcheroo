extends ProgressBar

func _ready() -> void:
	max_value = StatsUtil.max_hp
	value = StatsUtil.current_health

func _process(_delta: float) -> void:
	max_value = StatsUtil.max_hp
	value = StatsUtil.current_health
