extends CharacterBody2D

@export var playerSpeed = 300.0
@onready var sprite_2d = $Sprite2D

const MAMACAT = preload("res://assets/sprites/player/mamacat2.png")
const FLIPPEDMAMACAT = preload("res://assets/sprites/player/flippedmamacat.png")

var target = Vector2()

func _ready():
	target = position
	

func _input(event):
	if event.is_action_pressed("leftMouseClick"):
		target = get_global_mouse_position()

func _process(_delta):
	print(target, position)
	
	if target.x >= position.x:
		# Player moves to the right
		sprite_2d.texture = MAMACAT
	else:
		sprite_2d.texture = FLIPPEDMAMACAT
		
	target.y = position.y
	velocity = position.direction_to(target) * playerSpeed
	if position.distance_to(target) > 10:
		move_and_slide()
	else:
		position.x = target.x
