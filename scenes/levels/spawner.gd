extends Node2D

@export var spawn_infos: Array[SpawnInfo]
@export var start_point: Marker2D
@export var end_point: Marker2D
@onready var timer = $Timer as Timer

var time: int = 0


func _ready():
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():
	time += 1
	for spawn in spawn_infos:
		if spawn.start_spawn_time > time and spawn.end_spawn_time < time:
			continue
		spawn.time_passed += 1
		if spawn.time_passed < spawn.spawn_interval - (time / spawn.spawn_interval_modifier):
			continue
		spawn.time_passed = 0

		for i in range(0, spawn.amount + time / spawn.spawn_amount_modifier):
			var zombie = spawn.zombie_scene.instantiate() as Zombie
			var rando_y = randi_range(8, 16)
			zombie.global_position = Vector2(
				randf_range(start_point.position.x, end_point.position.x),
				start_point.position.y - rando_y
			)
			add_child(zombie)
			move_child(zombie, 0)
