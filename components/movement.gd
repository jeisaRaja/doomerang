class_name Movement
extends Node

@export var speed: int = 50
@export var direction: Vector2 = Vector2.UP
@export var turn_speed = 10.0
@export var input: InputHandler
@export var actor: CharacterBody2D

const ANGLE_THRESHOLD: float = 0.9
const WEIGHT_MULTIPLIER: float = 5.0


func _process(delta: float):
	var input_direction = Input.get_vector("left", "right", "up", "down")

	if input_direction != Vector2.ZERO:
		direction = direction.move_toward(input_direction, turn_speed * delta)

	direction = direction.normalized()

	actor.velocity = direction * speed
	actor.move_and_slide()
