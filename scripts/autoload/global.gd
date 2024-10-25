extends Node

var player: Player

var enemies: Array[PackedScene] = [
	preload("res://scenes/enemy/e_flesh/flesh.tscn"),
	preload("res://scenes/enemy/e_skeleton/skeleton.tscn"),
	preload("res://scenes/enemy/e_zombie/zombie.tscn")
]
