extends Node
class_name InputBuffer

## Frames for how long to buffer input
var buffer_time: int

var _buffer_queue_length: int = 0:
	get():
		return _callback_function_queue.size()
var _buffered_time_queue: Array[int] = []
var _callback_function_queue: Array[Callable] = [] 

func _process(_delta: float) -> void:
	var remove_indexes: Array[int] = []
	for i in range(_buffer_queue_length):
		var buffered_time: int = _buffered_time_queue[i] + 1
		if buffered_time > buffer_time:
			remove_indexes.append(i)
			continue
		_buffered_time_queue[i] = buffered_time
	
	# Unbuffer
	for i in remove_indexes:
		_unbuffer_input(i)

func _unbuffer_input(idx: int) -> void:
	_buffered_time_queue.remove_at(idx)
	_callback_function_queue.pop_at(idx).call()

## Buffers given input type, [param callback] is to unbuffer input once buffer runs out
func buffer_input(callback: Callable) -> void:	
	if _buffer_queue_length > 3:
		return
	_buffered_time_queue.append(0)
	_callback_function_queue.append(callback)
