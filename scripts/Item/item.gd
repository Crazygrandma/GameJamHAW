class_name item
extends Area2D

@export var ItemTooltipText = "Ein tolles Item"
@export var itemName = ""


@onready var tooltip = $Tooltip
@onready var collision_shape_2d = $CollisionShape2D

# Player ref
@onready var player = $"../Player"

@onready var level_1 = $".."




signal onItem
signal offItem
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
		var distance = position.distance_to(player.position)
		if distance < collision_shape_2d.shape.radius * 2:
			# Player can reach item
			# Emit itemPickup signal
			if level_1.currentItem:
				print("Item already in inv..swapping")
				var prevPos = self.position
				self.position = Vector2(1000,0)
				level_1.currentItem.position = prevPos
				level_1.currentItem = self
				itemClicked = false
			else:
				print("pickupItem")
				level_1.currentItem = self
				self.position = Vector2(1000,0)
				itemClicked = false
				
				

func _on_item_pickup():
	
	print("added to inv")
	# Move item out of frame
	position = Vector2(0,0)


	
	

func _on_mouse_entered():
	mouseOverItem = true
	onItem.emit()
	tooltip.visible = true

func _on_mouse_exited():
	mouseOverItem = false
	offItem.emit()
	tooltip.visible = false
	
func _input(event):
	if event.is_action_pressed("leftMouseClick"):
		if mouseOverItem:
			itemClicked = true
		else:
			#Player clicked somewhere else
			itemClicked = false
