extends Node

var bodyparts_ui: Dictionary = {
	Util.BODY_CATEGORY.SKELETON: {
		Util.BODY_TYPE.MAINHAND: preload("res://scenes/bodypart/parts/skeleton/skeleton_mainhand.tscn"),
		Util.BODY_TYPE.OFFHAND: preload("res://scenes/bodypart/parts/skeleton/skeleton_offhand.tscn"),
		Util.BODY_TYPE.LEFTLEG: preload("res://scenes/bodypart/parts/skeleton/skeleton_leftleg.tscn"),
		Util.BODY_TYPE.RIGHTLEG: preload("res://scenes/bodypart/parts/skeleton/skeleton_rightleg.tscn"),
		Util.BODY_TYPE.HEAD: preload("res://scenes/bodypart/parts/skeleton/skeleton_head.tscn"),
		Util.BODY_TYPE.TORSO: preload("res://scenes/bodypart/parts/skeleton/skeleton_torso.tscn")
	},
	Util.BODY_CATEGORY.FLESH: {
		Util.BODY_TYPE.MAINHAND: preload("res://scenes/bodypart/parts/flesh/flesh_mainhand.tscn"),
		Util.BODY_TYPE.OFFHAND: preload("res://scenes/bodypart/parts/flesh/flesh_offhand.tscn"),
		Util.BODY_TYPE.LEFTLEG: preload("res://scenes/bodypart/parts/flesh/flesh_leftleg.tscn"),
		Util.BODY_TYPE.RIGHTLEG: preload("res://scenes/bodypart/parts/flesh/flesh_rightleg.tscn"),
		Util.BODY_TYPE.HEAD: preload("res://scenes/bodypart/parts/flesh/flesh_head.tscn"),
		Util.BODY_TYPE.TORSO: preload("res://scenes/bodypart/parts/flesh/flesh_torso.tscn")
	},
	Util.BODY_CATEGORY.ZOMBIE: {
		Util.BODY_TYPE.MAINHAND: preload("res://scenes/bodypart/parts/zombie/zombie_mainhand.tscn"),
		Util.BODY_TYPE.OFFHAND: preload("res://scenes/bodypart/parts/zombie/zombie_offhand.tscn"),
		Util.BODY_TYPE.LEFTLEG: preload("res://scenes/bodypart/parts/zombie/zombie_leftleg.tscn"),
		Util.BODY_TYPE.RIGHTLEG: preload("res://scenes/bodypart/parts/zombie/zombie_rightleg.tscn"),
		Util.BODY_TYPE.HEAD: preload("res://scenes/bodypart/parts/zombie/zombie_head.tscn"),
		Util.BODY_TYPE.TORSO: preload("res://scenes/bodypart/parts/zombie/zombie_torso.tscn")
	}
}

var droppable_bodypart: PackedScene = preload("res://scenes/bodypart_pickable/body_part_pickable.tscn")
