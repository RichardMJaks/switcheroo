extends Node

@warning_ignore("unused_signal")
signal body_part_removed(type: Util.BODY_TYPE)
@warning_ignore("unused_signal")
signal body_part_added(type: Util.BODY_TYPE, part: BodyPart)
@warning_ignore("unused_signal")
signal body_part_picked_up(part: BodyPart)
@warning_ignore("unused_signal")
signal body_part_consumed()
@warning_ignore("unused_signal")
signal game_over()

@warning_ignore("unused_signal")
signal shake_camera
