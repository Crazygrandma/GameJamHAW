extends Area2D

@export var ItemTooltipText = "Ein tolles Item"
@export var pickupRadius = 200

@onready var tooltip = $Tooltip
@onready var collision_shape_2d = $CollisionShape2D
@onready var player = $"../Player"
@onready var animated_sprite_2d = $AnimatedSprite2D
const HAND_CLOSED = preload("res://assets/sprites/cursor/cursor_paw_clutch.png")
const HAND_OPEN = preload("res://assets/sprites/cursor/cursor_paw_open.png")

var itemIs = "air"

#func _process(delta):
	#if itemIs == "air":
		#animated_sprite_2d.play("0")
	#if itemIs == "":


#const HAND_OPEN = preload("res://assets/sprites/cursor/HandOpen.png")
#const HAND_CLOSED = preload("res://assets/sprites/cursor/HandClosed.png")

var mouseOverItem = false
var itemClicked = false
func _ready():
	tooltip.visible = false
	tooltip.text = ItemTooltipText
	

func _process(delta):
	if(itemClicked):
		var distance = position.distance_to(player.position)
		if distance < collision_shape_2d.shape.radius * 2:
			# Player can reach item
			queue_free()

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
			itemClicked = true
		else:
			#Player clicked somewhere else
			itemClicked = false
