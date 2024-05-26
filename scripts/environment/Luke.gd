class_name luke
extends Area2D

@export var ItemTooltipText = "Ein tolles Item"
@export var itemName = ""


@export var requestedItemName = ""
@export var resultingItem: item
@onready var tooltip = $Tooltip
@onready var collision_shape_2d = $CollisionShape2D

# Player ref
@onready var player = $"../Player"

@onready var level_1 = $".."

@onready var interaction_collider = $InteractionCollider


signal itemPickup(name)

const CURSOR_PAW_OPEN = preload("res://assets/sprites/cursor/cursor_paw_open.png")
const CURSOR_PAW_CLUTCH = preload("res://assets/sprites/cursor/cursor_paw_clutch.png")


var mouseOverItem = false
var itemClicked = false


func _ready():
	# Connect to signals

	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	
	tooltip.visible = false
	tooltip.text = ItemTooltipText

func _process(delta):
	# Check if item is clicked
	if(itemClicked):
		# Check if player is near item
		var distance = interaction_collider.position.distance_to(player.position)
		if distance < 100:
			# Player can reach item
			if level_1.currentItem:
				print(curr)
				# check if item is required
				if level_1.currentItem.itemName == requestedItemName:
					print("End game")
					
					
					
				

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


