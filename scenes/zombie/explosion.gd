class_name Explosion
extends Area2D

@export var anim: AnimationPlayer
var bodies: Array[Node2D] = []


func explode():
	anim.play("explode")
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	area_entered.connect(_on_area_entered)
	await anim.animation_finished

	print(bodies)
	for body in bodies:
		body.hit()


func _on_area_entered(area: Area2D):
	if area is Hurtbox:
		area.actor.hit()


func _on_body_exited(body: Node2D):
	if body in bodies:
		bodies.erase(body)


func _on_body_entered(body: Node2D):
	print(body)
	if body is Player:
		bodies.append(body)
