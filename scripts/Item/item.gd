class_name item
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
@onready var pickupsound = $"../Pickupsound"
@onready var combine_success = $"../CombineSuccess"
@onready var combine_fail = $"../CombineFail"


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
		if distance < collision_shape_2d.shape.radius:
			# Player can reach item
			
			# play pickupsound
			pickupsound.play()
			
			# Emit itemPickup signal
			if level_1.currentItem:
				
				# check if item is required
				if level_1.currentItem.itemName == requestedItemName:
					print("Do something")
					
					combine_success.play()
					
					# Spawn resulting item
					level_1.currentItem = null
					var prevPos = self.position
					resultingItem.position = prevPos
					
					queue_free()
					
					
					
				else:
					combine_fail.play()
						
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


