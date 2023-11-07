extends Node

var LevelClass = load("res://Scripts/level.gd")
var BOARD_ELEMENTS = LevelClass.BOARD_ELEMENTS

func parse_file(file: FileAccess):
	var board_pattern = RegEx.new()
	board_pattern.compile("^[# pPbB@+$*.\\-_]+$")
	
	var lines = []
	while not file.eof_reached():
		var line = file.get_line()
		var board_result = board_pattern.search(line)
		if board_result:
			lines.append(line)
	var level = create_level(lines)
	return [level]


var board_dict = {
	"#": BOARD_ELEMENTS.wall,
	" ": BOARD_ELEMENTS.floor,
	"-": BOARD_ELEMENTS.floor,
	"_": BOARD_ELEMENTS.floor,
	"p": BOARD_ELEMENTS.player,
	"@": BOARD_ELEMENTS.player,
	"P": BOARD_ELEMENTS.player_on_goal,
	"+": BOARD_ELEMENTS.player_on_goal,
	"b": BOARD_ELEMENTS.box,
	"$": BOARD_ELEMENTS.box,
	"B": BOARD_ELEMENTS.box_on_goal,
	"*": BOARD_ELEMENTS.box_on_goal,
	".": BOARD_ELEMENTS.goal,
}

func create_level(lines, title: String = ""):
	var level = LevelClass.new()
	level.title = title
	for line in lines:
		var row = []
		for ch in line:
			row.append(board_dict[ch])
		if len(row) > 0:
			level.board.append(row)
	return level
