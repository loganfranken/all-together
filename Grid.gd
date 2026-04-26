extends Node2D

signal player_confirmed

func _input(event: InputEvent) -> void:
	if visible and event.is_action_released("swap"):
		emit_signal("player_confirmed", _get_dog_coordinates())
		
func _get_dog_coordinates():
	var nodes = []
	for dog in $Dogs.get_children():
		nodes.append(Vector2i(dog.position.x / 80, dog.position.y / 80))
		
	return nodes
