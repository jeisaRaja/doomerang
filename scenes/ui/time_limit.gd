extends ProgressBar

@onready var timer = $Timer as Timer


func _ready():
	max_value = timer.wait_time
	Events.player_returned.connect(_on_player_returned)
	Events.player_thrown.connect(_on_player_thrown)


func _process(_delta):
	value = timer.time_left
	if value <= 0:
		Events.player_fell.emit()


func _on_player_returned():
	value = max_value
	timer.stop()
	set_process(false)


func _on_player_thrown():
	timer.start()
	set_process(true)
