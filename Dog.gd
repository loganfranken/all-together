extends CharacterBody2D

var _is_dragging = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		_is_dragging = event.is_pressed()

func _process(delta: float) -> void:
	if _is_dragging:
		position = get_global_mouse_position()
