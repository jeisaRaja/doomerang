class_name Player
extends CharacterBody2D

@export var movement: Movement
@export var player_input: PlayerInput

enum { IDLE, FLY }
var state

@onready var anim = $AnimationPlayer as AnimationPlayer


func _ready():
	state = FLY


func _physics_process(_delta):
	if velocity != Vector2.ZERO:
		if not anim.is_playing():
			anim.play("throw")
	else:
		anim.play("RESET")


func throw():
	state = FLY
	movement.direction = Vector2.UP
