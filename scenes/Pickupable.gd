extends Area2D


var closed = load("res://addons/awesome_custom_cursor/assets/cursors/hand_closed.png")
var open = load("res://addons/awesome_custom_cursor/assets/cursors/hand_open.png")


func _mouse_enter():
	Input.set_custom_mouse_cursor(open)
	
func _mouse_exit():
	Input.set_custom_mouse_cursor(closed)

