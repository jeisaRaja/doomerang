extends Node2D

@export var zombie_scene: PackedScene
@export var start_point: Marker2D
@export var end_point: Marker2D
@onready var timer = $Timer as Timer


func _ready():
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():
	var zombie = zombie_scene.instantiate() as Node2D
	zombie.global_position = Vector2(
		randf_range(start_point.global_position.x, end_point.global_position.x),
		start_point.global_position.y
	)
	add_child(zombie)
	move_child(zombie, 0)
