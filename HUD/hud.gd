extends Control

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():	

	display()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	display()
	pass


func display():
	var player_objekt = get_parent().get_node("Player")
	var move_counter = "Moves: 0"
	if player_objekt:
		move_counter = player_objekt.move_counter
	else:
		print("Internal err. Player object not found (HUD)")
		
		
	$MarginContainer/VBoxContainer/MovesText.text ="Moves: " + str(move_counter)
	$MarginContainer/VBoxContainer/TimeText.text = str(time)




func _on_timer_timeout():
	time += 1
	pass # Replace with function body.
