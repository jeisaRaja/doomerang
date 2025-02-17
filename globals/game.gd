extends Node

@export var main_scene: PackedScene
@export var menu: PackedScene
@export var end_screen_scene: PackedScene

var player_soul: int = 3:
	set = set_player_soul


func set_player_soul(value):
	player_soul = value
	Events.player_soul_changed.emit()


func take_soul():
	player_soul = clampi(player_soul - 1, 0, player_soul)
	if player_soul == 0:
		Events.player_lost.emit()
