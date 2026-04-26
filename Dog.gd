extends CharacterBody2D

var _is_dragging = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		_is_dragging = event.is_pressed()

func _process(_delta: float) -> void:
	if _is_dragging:
		var mouse_position = get_global_mouse_position()
		position.x = mouse_position.x - (int(mouse_position.x) % 80) + 40
		position.y = mouse_position.y - (int(mouse_position.y) % 80) + 40
