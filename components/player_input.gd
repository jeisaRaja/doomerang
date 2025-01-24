class_name PlayerInput
extends InputHandler

@export var player: Player


func _process(_delta):
	if player.state == player.FLY:
		direction = Input.get_vector("left", "right", "up", "down")
