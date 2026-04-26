extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_released("ui_accept"):
		_get_dog_coordinates()
		
func _get_dog_coordinates():
	var positions = []
	for dog in $Dogs.get_children():
		positions.append(Vector2i(dog.position.x / 80, dog.position.y / 80))
		
	print(positions)
