extends VBoxContainer

var mapDisplay = true #hier is the Path to the maps with there Levels replace "true" with the path $.../.../ 
var mapLinks = {
	"Button1": "",
	"Button2": "",
	"Button3": "",
	"Button4": "",
	"Button5": "",
	"Button6": ""
}

func _ready():
	mapDisplay = false

func _on_button_mouse_entered(button):
	var buttonName = button.name
	var mapLink = mapLinks.get(buttonName, "")
	if mapLink != "":
		# Here you can set the mapLink to navigate to the map when it's available.
		# For example, you can use the load_map() function to load the map.
		# load_map(mapLink)
		mapDisplay = true

func _on_button_mouse_exited(button):
	mapDisplay = false


