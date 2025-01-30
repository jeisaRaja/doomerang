extends Node2D


func _ready():
	Events.player_died.connect(_on_player_died)


func _on_player_died():
	print("player died")
