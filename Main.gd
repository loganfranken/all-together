extends Node2D

const PlayerNode = preload("res://scenes/PlayerNode.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("swap"):
		$Grid.visible = true
		$Exploration.visible = false

func _on_grid_player_confirmed(player_nodes) -> void:
	$Grid.visible = false
	$Exploration.visible = true
	
	for node in $Exploration/Player.get_children():
		$Exploration/Player.remove_child(node)
		node.queue_free()
		
	for node in player_nodes:
		var player_node = PlayerNode.instantiate()
		player_node.position = node * 16
		$Exploration/Player.add_child(player_node)
