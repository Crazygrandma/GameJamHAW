extends Node2D

@export var currentItem: item
@export var playerFloor = 0

@export var catOnTable = false
@export var catOnShelf = false


const CURSOR_PAW_CLUTCH = preload("res://assets/sprites/cursor/cursor_paw_clutch.png")
func _ready():
	Input.set_custom_mouse_cursor(CURSOR_PAW_CLUTCH)


