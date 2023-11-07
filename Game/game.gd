extends Node

var BOARD_ELEMENTS = load("res://Scripts/level.gd").BOARD_ELEMENTS

@onready var tilemap = $TileMap
@onready var player = $Player
@onready var boxes = $Boxes
@onready var spots = $Spots

var box_scene = preload("res://Scenes/box.tscn")
var spot_scene = preload("res://Scenes/spot.tscn")


func _ready():
	var file_parser = load("res://Scripts/file_parser.gd").new()
	var file = FileAccess.open("res://Levels/test.txt", FileAccess.READ)
	var levels = file_parser.parse_file(file)
	load_level(levels[0])

func load_level(level):
	var x_value = 0
	var y_value = 0
	var wall_pos = Vector2i(10, 17)
	for row in level.board:
		x_value = 0
		for tile in row:
			match tile:
				BOARD_ELEMENTS.wall:
					tilemap.set_cell(0, Vector2i(x_value, y_value), 0, wall_pos)
				BOARD_ELEMENTS.player:
					move_player(x_value, y_value)
				BOARD_ELEMENTS.box:
					create_box(x_value, y_value)
				BOARD_ELEMENTS.goal:
					create_spot(x_value, y_value)
				BOARD_ELEMENTS.player_on_goal:
					move_player(x_value, y_value)
					create_spot(x_value, y_value)
				BOARD_ELEMENTS.box_on_goal:
					create_spot(x_value, y_value)
					create_box(x_value, y_value)
			x_value += 1
		y_value += 1
	

func move_player(x, y):
	player.position = Vector2(x * 16, y * 16)

func create_box(x, y):
	var box = box_scene.instantiate()
	box.position = Vector2(x * 16, y * 16)
	boxes.add_child(box)
	
func create_spot(x, y):
	var spot = spot_scene.instantiate()
	spot.position = Vector2(x * 16, y * 16)
	boxes.add_child(spot)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Menu/start_menu.tscn")# Replace with function body.
