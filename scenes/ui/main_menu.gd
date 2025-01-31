extends Control

@onready var play_btn = $Play as Button


func _ready():
	play_btn.pressed.connect(on_play_btn_pressed)


func on_play_btn_pressed():
	get_tree().change_scene_to_packed(Game.main_scene)
