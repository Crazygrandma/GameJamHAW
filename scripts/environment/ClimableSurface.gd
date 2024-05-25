extends Area2D

@export var ItemTooltipText = "Ein tolles Item"
@export var pickupRadius = 200

@onready var tooltip = $Tooltip
@onready var player = $"../Player"
@onready var collision_shape_2d = $CollisionShape2D

@onready var bottom_entry = $BottomEntry
@onready var top_entry = $TopEntry



const HAND_OPEN = preload("res://assets/sprites/cursor/HandOpen.png")
const HAND_CLOSED = preload("res://assets/sprites/cursor/HandClosed.png")

var mouseOverItem = false
var itemClicked = false

var playerAtBottom = true
var playerAtTop = false


func _ready():
	tooltip.visible = false
	tooltip.text = ItemTooltipText

func _process(delta):
	if(itemClicked):
		var distance = position.distance_to(player.position)
		if distance < collision_shape_2d.shape.radius * 2:
			if playerAtBottom:
				player.moveToPos(top_entry.position)
			elif playerAtTop:
				player.moveToPos(bottom_entry.position)

func _on_mouse_entered():
	mouseOverItem = true
	Input.set_custom_mouse_cursor(HAND_OPEN)
	tooltip.visible = true

func _on_mouse_exited():
	mouseOverItem = false
	Input.set_custom_mouse_cursor(HAND_CLOSED)
	tooltip.visible = false
	
	
func _input(event):
	if event.is_action_pressed("leftMouseClick"):
		if mouseOverItem:
			player.moveToPos(position)
			itemClicked = true
			print("Clicked Ladder")
		else:
			#Player clicked somewhere else
			itemClicked = false


