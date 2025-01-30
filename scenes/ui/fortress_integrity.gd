extends TextureProgressBar


func _ready():
	value = max_value
	Events.integrity_changed.connect(_on_integrity_changed)


func _on_integrity_changed(val: float):
	value = val
