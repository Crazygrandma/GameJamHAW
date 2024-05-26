extends Node2D

@export var currentItem: item
@export var playerFloor = 0

@export var catOnTable = false
@export var catOnShelf = false

@onready var label = $Label

@onready var music = $Music


const CURSOR_PAW_CLUTCH = preload("res://assets/sprites/cursor/cursor_paw_clutch.png")
func _ready():
	music.play()
	Input.set_custom_mouse_cursor(CURSOR_PAW_CLUTCH)

func _process(delta):
	if currentItem:
		label.text = currentItem.ItemTooltipText
