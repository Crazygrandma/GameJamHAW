extends Node2D

@export var itemType = ""
@onready var player = $"../Player"
@onready var level_1 = $".."


signal item_pickup(item)


var mouseOverItem = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("mouse_entered", _on_mouse_entered)

func _on_mouse_entered():
	mouseOverItem = true
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _input(event):
	if event.is_action_pressed("leftMouseClick"):
		if mouseOverItem:
			if position.distance_to(player.position) < 100:
				# Pickup item
				#check if item full
				if level_1.currentItem != "":
					item_pickup.emit(itemType)
					queue_free()
				else:
					# Swapping item 
					pass
					
				
				
				
				
