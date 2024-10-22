extends Node

@onready var stats = Stats.new()
var movement_speed: float = 100

var vision_range: float = 100

var max_hp: float = 5

var damage: int = 1
var attack_speed: int = 1

var dash_length: float = 100
var dash_cd: float = 1

#TODO: Mana implementation
