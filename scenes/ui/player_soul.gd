extends Control

@export var soul_sprite: Texture2D
@onready var hbox = $HBoxContainer as HBoxContainer


func _ready():
	Events.player_soul_changed.connect(_on_player_soul_changed)
	for i in range(Game.player_soul):
		var tex_rect = TextureRect.new()
		tex_rect.texture = soul_sprite
		tex_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL

		hbox.add_child(tex_rect)


func _on_player_soul_changed():
	print(Game.player_soul)
	var souls = hbox.get_children()
	for i in range(souls.size()):
		var soul = souls[i] as TextureRect
		if Game.player_soul > i:
			soul.visible = true
		else:
			soul.visible = false
