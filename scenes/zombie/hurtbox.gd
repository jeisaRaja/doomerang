class_name Hurtbox
extends Area2D

@onready var actor = $".."
@export var sprite: Node2D


func _ready():
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D):
	if area.is_in_group("wall"):
		actor.queue_free()


func _on_body_entered(body: Node2D):
	if body is Player:
		actor.hit()
