class_name Movement
extends Node

@export var speed: int = 50
@export var direction: Vector2 = Vector2.UP
@export var turn_speed = 10.0
@export var input: InputHandler
@export var actor: CharacterBody2D


func _physics_process(delta):
	if input.direction != Vector2.ZERO and not Utils.are_scalars(input.direction, direction):
		direction = direction.move_toward(input.direction, turn_speed * delta)

	actor.velocity = direction.normalized() * speed

	actor.move_and_slide()
