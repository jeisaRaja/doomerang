class_name Explosion
extends Area2D

enum { INACTIVE, ACTIVE }

@export var anim: AnimationPlayer
@export var explode_particle: PackedScene
var bodies: Array[Node2D] = []
var status := INACTIVE


func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)


func explode():
	if status == ACTIVE:
		return
	status = ACTIVE
	anim.play("explode")
	await anim.animation_finished
	var _particle = explode_particle.instantiate()
	_particle.position = global_position
	_particle.rotation = global_rotation
	_particle.emitting = true

	get_tree().root.add_child(_particle)

	for body in bodies:
		if body and is_instance_valid(body):
			body.hit()
	$"..".queue_free()


func _on_area_exited(area: Area2D):
	if area in bodies:
		bodies.erase(area)


func _on_area_entered(area: Area2D):
	if area is Hurtbox:
		if area.actor != $"..":
			bodies.append(area.actor)


func _on_body_exited(body: Node2D):
	if body in bodies:
		bodies.erase(body)


func _on_body_entered(body: Node2D):
	if body is Player:
		bodies.append(body)
