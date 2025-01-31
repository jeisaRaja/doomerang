extends Node2D


func _ready():
	Events.player_lost.connect(_on_player_lost)


func _on_player_lost():
	get_tree().change_scene_to_packed(Game.end_screen_scene)
