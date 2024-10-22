extends Node
class_name InputHandler
## This class is used to simulate input commands.
##
## Player character usage
## Handle player inputs to get player intents
## 
## Enemy character usage
## Use enemy AI node to set intents of the enemy
# TODO: Implement methods
# TODO: Implement template

var movement_direction: Vector2:
	get:
		return movement_direction.normalized()
