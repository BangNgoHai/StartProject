extends CharacterBody2D

@export var tile_size: int = 16
var inputs = {
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT,
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
}
@onready var ray: RayCast2D = $RayCast2D
@export var strength: int = 1
var move_counter: int = 0

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(inputs[dir] * tile_size)


func move(direction: Vector2) -> void:
	ray.target_position = direction
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += direction
		move_counter += 1
	else:
		var collider = ray.get_collider()
		if collider.is_in_group("box"):
			if collider.try_move(direction, strength - 1):
				position += direction
				move_counter += 1
	#print(move_counter)
