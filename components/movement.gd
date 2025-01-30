class_name Movement
extends Node

@export var direction: Vector2 = Vector2.UP
@export var turn_speed = 10.0
@export var input: InputHandler
@export var player: Player
@export var base_speed: int = 50
@export var speed: int = 50
@export var dash_speed: int = 100
@export var dash_duration: float = 0.5

const ANGLE_THRESHOLD: float = 0.9
const WEIGHT_MULTIPLIER: float = 5.0


func dash():
	speed = dash_speed
	player.state = player.DASH
	await get_tree().create_timer(dash_duration).timeout
	speed = base_speed
	player.state = player.FLY


func _physics_process(delta):
	if player.state == player.IDLE:
		player.velocity = Vector2.ZERO
		return

	if player.state != player.DASH:
		var input_direction = Input.get_vector("left", "right", "up", "down")
		if input_direction != Vector2.ZERO:
			direction = direction.move_toward(input_direction, turn_speed * delta)

	direction = direction.normalized()
	player.velocity = direction * speed

	var collision_info = player.move_and_collide(player.velocity * delta)

	if collision_info:
		var normal = collision_info.get_normal()
		var collider = collision_info.get_collider()

		if collider and collider.is_in_group("wall"):
			direction = player.velocity.bounce(normal).normalized()
