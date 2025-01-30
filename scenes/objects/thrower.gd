extends Area2D


func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D):
	if body is Player:
		var player = body

		Events.player_returned.emit()
		player.state = player.IDLE

		var timer = get_tree().create_timer(1)
		await timer.timeout

		player.throw()
		Events.player_thrown.emit()
