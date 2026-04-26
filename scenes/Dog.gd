extends Area2D

var _is_dragging = false
var _is_mouse_over = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		_is_dragging = event.is_pressed() and _is_mouse_over

func _on_mouse_entered() -> void:
	_is_mouse_over = true

func _on_mouse_exited() -> void:
	_is_mouse_over = false

func _process(_delta: float) -> void:
	if _is_dragging:
		var mouse_position = get_global_mouse_position()
		position.x = mouse_position.x - (int(mouse_position.x) % 80) + 40
		position.y = mouse_position.y - (int(mouse_position.y) % 80) + 40
