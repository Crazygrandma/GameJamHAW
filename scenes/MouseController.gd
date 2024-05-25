extends Node

# Load the custom images for the mouse cursor.
var closed = load("res://addons/awesome_custom_cursor/assets/cursors/hand_closed.png")
var open = load("res://addons/awesome_custom_cursor/assets/cursors/hand_open.png")


func _ready():
	# Changes only the arrow shape of the cursor.
	# This is similar to changing it in the project settings.
	Input.set_custom_mouse_cursor(closed)
	
	
