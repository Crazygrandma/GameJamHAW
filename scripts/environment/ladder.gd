class_name ladder
extends Area2D

@export var ItemTooltipText = "Ein tolles Item"
@export var jumpHeight = 100

@export var exitVector: Vector2



@onready var tooltip = $Tooltip

# Player ref
@onready var player = $"../Player"

@onready var level_1 = $".."


signal itemPickup(name)

const CURSOR_PAW_OPEN = preload("res://assets/sprites/cursor/cursor_paw_open.png")
const CURSOR_PAW_CLUTCH = preload("res://assets/sprites/cursor/cursor_paw_clutch.png")
@onready var from_collider = $FromCollider
@onready var to_collider = $ToCollider

@onready var min_collider = $MinCollider
@onready var max_collider = $MaxCollider

var mouseOverItem = false
var itemClicked = false

var playerOverlap = false

var playerOnTop = false


func _ready():
	
	# Connect to signals
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)
	
	tooltip.visible = false
	tooltip.text = ItemTooltipText


func _process(delta):
	if playerOverlap:
		if itemClicked:
			if playerOnTop:
				player.targetMinX = -500
				player.targetMaxX = 500
				player.jumpTo(from_collider.position)
				playerOnTop = false
			else:
				player.jumpTo(to_collider.position)
				player.targetMinX = min_collider.position.x
				player.targetMaxX = max_collider.position.x
				playerOnTop = true
			itemClicked=false

func _on_body_entered(body):
	playerOverlap = true


func _on_body_exited(body):
	playerOverlap = false

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


