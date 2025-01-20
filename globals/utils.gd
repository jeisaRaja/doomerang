extends Node


func are_scalars(v1: Vector2, v2: Vector2) -> bool:
	if v1.length() == 0 or v2.length() == 0:
		return false

	var norm_v1 = v1.normalized()
	var norm_v2 = v2.normalized()

	if norm_v1 == norm_v2 or norm_v1 == -norm_v2:
		return true

	return false
