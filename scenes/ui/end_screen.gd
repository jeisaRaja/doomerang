extends CanvasLayer

@onready var retry_btn = $Retry as Button


func _ready():
	retry_btn.pressed.connect(_on_retry_pressed)


func _on_retry_pressed():
	get_tree().change_scene_to_packed(Game.main_scene)
