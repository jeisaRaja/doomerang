class_name Fortress
extends Area2D

@export var integrity: float = 100


func _ready():
	body_entered.connect(_on_body_entered)


func take_damage(val: float):
	integrity = clampf(integrity - val, 0, integrity)
	if integrity == 0:
		Events.player_lost.emit()


func _on_body_entered(body: Node2D):
	if body is Zombie:
		take_damage(body.damage)
		body.queue_free()
		Events.integrity_changed.emit(integrity)
