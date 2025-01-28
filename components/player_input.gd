class_name PlayerInput
extends InputHandler

@export var player: Player

var is_dashing: bool = false


func _process(_delta):
	is_dashing = false
	if player.state == player.FLY:
		direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_pressed("dash"):
		is_dashing = true
