extends ProgressBar

@onready var timer = $Timer as Timer


func _ready():
	max_value = timer.wait_time
	Events.player_returned.connect(_on_player_returned)
	Events.player_thrown.connect(_on_player_thrown)


func _process(_delta):
	value = timer.time_left


func _on_player_returned():
	timer.stop()
	value = max_value


func _on_player_thrown():
	timer.start()
