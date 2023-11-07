class_name level extends Node

enum BOARD_ELEMENTS {
	floor,
	wall,
	player,
	player_on_goal,
	box,
	box_on_goal,
	goal,
}

var title: String = ""
var board: Array = []
var puzzle_notes: Dictionary = {}
var solution: String = ""
