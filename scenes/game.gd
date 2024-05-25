extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Hello World"
	print("Hello, World")


func _input(event):
	if event.is_action_pressed("my_action"):
		$Label.modulate = Color.GREEN
		
	if event.is_action_released("my_action"):
		$Label.modulate = Color.RED
	
