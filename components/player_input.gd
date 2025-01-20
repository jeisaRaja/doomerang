class_name PlayerInput
extends InputHandler


func _process(_delta):
	direction = Input.get_vector("left", "right", "up", "down")
