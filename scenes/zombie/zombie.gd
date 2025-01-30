class_name Zombie
extends CharacterBody2D

@export var speed: int = 30
@export var spawn_interval: int = 1
@export var damage: float = 5


func _physics_process(_delta):
	velocity = Vector2.DOWN * speed
	move_and_slide()
