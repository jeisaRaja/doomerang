class_name Player
extends CharacterBody2D

@export var movement: Movement
@export var player_input: PlayerInput

enum { IDLE, FLY, DASH }
var state

@onready var anim = $AnimationPlayer as AnimationPlayer


func _ready():
	Events.player_fell.connect(_on_player_fell)
	state = FLY


func _on_player_fell():
	state = IDLE
	await get_tree().create_timer(1).timeout
	global_position = %Thrower.global_position
	Game.take_soul()


func _physics_process(_delta):
	if player_input.is_dashing:
		movement.dash()
	if velocity != Vector2.ZERO:
		if not anim.is_playing():
			anim.play("throw")
	else:
		anim.play("RESET")


func throw():
	state = FLY
	movement.direction = Vector2.UP
