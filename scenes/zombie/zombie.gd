class_name Zombie
extends CharacterBody2D

@export var speed: int = 30
@export var spawn_interval: int = 1
@export var damage: float = 5
@onready var sprite = $AnimatedSprite2D as AnimatedSprite2D


func _physics_process(_delta):
	velocity = Vector2.DOWN * speed
	move_and_slide()


func hit():
	var shader_mat = sprite.material as ShaderMaterial
	shader_mat.set_shader_parameter("Enable", true)
	await get_tree().create_timer(0.1).timeout
	shader_mat.set_shader_parameter("Enable", false)
	queue_free()
