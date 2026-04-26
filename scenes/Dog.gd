extends Node2D

var _is_dragging = false
var _is_mouse_over = false
var _original_position = null

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() and _is_mouse_over:
			_start_dragging()
		elif _is_dragging:
			_stop_dragging()

func _on_mouse_entered() -> void:
	_is_mouse_over = true

func _on_mouse_exited() -> void:
	_is_mouse_over = false

func _process(_delta: float) -> void:
	if _is_dragging:
		var mouse_position = get_global_mouse_position()
		position.x = mouse_position.x - (int(mouse_position.x) % 80) + 40
		position.y = mouse_position.y - (int(mouse_position.y) % 80) + 40
	else:
		modulate = Color.WHITE
		
func _start_dragging():
	_is_dragging = true
	_original_position = position
	modulate = Color.YELLOW
	
func _stop_dragging():
	_is_dragging = false
	
	if not _is_in_valid_drop_position():
		position = _original_position
	
	_original_position = null
	modulate = Color.WHITE
	
func _is_in_valid_drop_position():
	if(len($Self.get_overlapping_areas().filter(func(b): return b.is_in_group("dog_body"))) > 0):
		return false
		
	if(len($Up.get_overlapping_areas().filter(func(b): return b.is_in_group("dog_body"))) > 0):
		return true
	
	if(len($Left.get_overlapping_areas().filter(func(b): return b.is_in_group("dog_body"))) > 0):
		return true
		
	if(len($Right.get_overlapping_areas().filter(func(b): return b.is_in_group("dog_body"))) > 0):
		return true
		
	if(len($Down.get_overlapping_areas().filter(func(b): return b.is_in_group("dog_body"))) > 0):
		return true
