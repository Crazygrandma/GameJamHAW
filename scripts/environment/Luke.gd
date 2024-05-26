class_name luke
extends Area2D

@export var ItemTooltipText = "Ein tolles Item"
@export var itemName = ""

@onready var hatch_open = $"../HatchOpen"

@export var requestedItemName = ""
@export var resultingItem: item
@onready var tooltip = $Tooltip

# Player ref
@onready var player = $"../Player"

@onready var level_1 = $".."

@onready var outro = preload("res://scenes/Outro.tscn") as PackedScene

signal itemPickup(name)

const CURSOR_PAW_OPEN = preload("res://assets/sprites/cursor/cursor_paw_open.png")
const CURSOR_PAW_CLUTCH = preload("res://assets/sprites/cursor/cursor_paw_clutch.png")
@onready var exit_area = $"../ExitArea"


var mouseOverItem = false
var itemClicked = false

var playerinEndArea = false


func _ready():
	# Connect to signals

	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	exit_area.connect("body_entered", _on_body_entered)
	exit_area.connect("body_exited", _on_body_exited)
	
	tooltip.visible = false
	tooltip.text = ItemTooltipText

func _on_body_entered(body):
	playerinEndArea = true
	
func _on_body_exited(body):
	playerinEndArea = false

func _process(delta):
	# Check if item is clicked
	if(itemClicked):
		
		if playerinEndArea:
			print("Player can reach")
			if level_1.currentItem:
				print(level_1.currentItem)
				# check if item is required
				if level_1.currentItem.itemName == requestedItemName:
					
					hatch_open.play()
					
					print("End game")
					
					get_tree().change_scene_to_packed(outro)
					
					itemClicked = false
					
					
					
				

func _on_mouse_entered():
	mouseOverItem = true
	#onItem.emit()
	Input.set_custom_mouse_cursor(CURSOR_PAW_OPEN)
	tooltip.visible = true

func _on_mouse_exited():
	mouseOverItem = false
	#offItem.emit()
	Input.set_custom_mouse_cursor(CURSOR_PAW_CLUTCH)
	tooltip.visible = false
	
func _input(event):
	if event.is_action_pressed("leftMouseClick"):
		if mouseOverItem:
			itemClicked = true
		else:
			#Player clicked somewhere else
			itemClicked = false


