class_name Zombie
extends CharacterBody2D

@export var speed: int = 30


func _physics_process(_delta):
	velocity = Vector2.DOWN * speed
	move_and_slide()
