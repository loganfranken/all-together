extends CharacterBody2D

const PlayerNode = preload("res://scenes/PlayerNode.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

const node_infos = [Vector2i(0, 0), Vector2i(1, 1), Vector2i(2, 1)]

func _ready() -> void:
	for node_info in node_infos:
		var player_node = PlayerNode.instantiate()
		player_node.position.x = node_info[0] * 16
		player_node.position.y = node_info[1] * 16
		add_child(player_node)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
