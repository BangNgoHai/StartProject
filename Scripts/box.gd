extends CharacterBody2D

@onready var ray = $RayCast2D

func try_move(direction: Vector2, strength: int) -> bool:
	ray.target_position = direction
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += direction
		return true
	elif strength > 0:
		var collider = ray.get_collider()
		if collider.get_class() == "CharacterBody2D":
			if collider.try_move(direction, strength - 1):
				position += direction
				return true
	return false
