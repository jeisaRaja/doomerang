class_name BomberZombie
extends Zombie

@onready var anim = $AnimationPlayer as AnimationPlayer
@onready var explosion = $Explosion as Explosion


func _ready():
	anim.play("bomb")


func _physics_process(delta):
	super._physics_process(delta)


func hit():
	sprite.stop()
	velocity = Vector2.ZERO
	explosion.explode()
	set_physics_process(false)
