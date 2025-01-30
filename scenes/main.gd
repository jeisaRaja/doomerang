extends Node2D


func _ready():
	Events.player_lost.connect(_on_player_lost)


func _on_player_lost():
	print("player lost")
