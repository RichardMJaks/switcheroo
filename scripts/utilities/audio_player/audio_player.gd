extends Node
class_name AudioPlayer

var audio_clips: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is AudioStreamPlayer:
			audio_clips[child.name] = child

func play(clip_name: String) -> void:
	if not audio_clips.has(clip_name):
		push_error("Clip %s does not exist" % clip_name)
		return
	
	audio_clips[clip_name].play()
