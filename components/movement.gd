class_name Movement
extends Node

@export var speed: int = 50
@export var direction: Vector2 = Vector2.UP
@export var turn_speed = 10.0
@export var input: InputHandler
@export var actor: CharacterBody2D

const ANGLE_THRESHOLD: float = 0.9
const WEIGHT_MULTIPLIER: float = 2.0


func _process(delta: float):
	var input_direction = Input.get_vector("left", "right", "up", "down")

	if input_direction != Vector2.ZERO:
		var norm_input = input_direction.normalized()
		var norm_direction = direction.normalized()

		var alignment = norm_input.dot(norm_direction)

		if alignment > -ANGLE_THRESHOLD:
			var weight = clamp((1.0 - abs(alignment)) * WEIGHT_MULTIPLIER, 0, 1)

			direction = direction.move_toward(input_direction, turn_speed * delta * weight)

	direction = direction.normalized()

	actor.velocity = direction * speed
	actor.move_and_slide()
