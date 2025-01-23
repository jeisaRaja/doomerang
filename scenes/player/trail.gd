extends Line2D

@export var player: Player
@export var MAX_LENGTH: int

var queue: Array


func _process(_delta):
	var pos = player.position
	queue.push_front(pos)

	if queue.size() > MAX_LENGTH:
		queue.pop_back()

	clear_points()

	for point in queue:
		add_point(point)
