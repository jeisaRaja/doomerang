class_name Player
extends CharacterBody2D

@onready var anim = $AnimationPlayer as AnimationPlayer


func _ready():
	pass


func _physics_process(_delta):
	if not anim.is_playing():
		if velocity != Vector2.ZERO:
			anim.play("throw")
