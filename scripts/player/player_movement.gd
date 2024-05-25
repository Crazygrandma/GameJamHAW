extends CharacterBody2D

@export var playerSpeed = 300.0
@onready var sprite_2d = $Sprite2D
@onready var MamaCat = $MamaCatAnimation

#const MAMACAT = preload("res://assets/sprites/player/mamacat2.png")
#const FLIPPEDMAMACAT = preload("res://assets/sprites/player/flippedmamacat.png")

var target = Vector2()
var facing: bool = false

func _ready():
	target = position
	

func _input(event):
	if event.is_action_pressed("leftMouseClick"):
		target = get_global_mouse_position()

func _process(_delta):
	print(target, position, velocity)
	
	if target.x >= position.x: #walking?
		# Player moves to the right
		MamaCat.play("Walk_R")
	else:
		MamaCat.play("Walk_L")
	
	if facing == true && velocity.x == 0: #idle
		MamaCat.play("Idle_L")
	else:
		MamaCat.play("Idle_R")
	
	target.y = position.y
	velocity = position.direction_to(target) * playerSpeed
	
	if velocity.x < 0:
		facing = true
	else:
		facing = false
		
	if position.distance_to(target) > 10:
		move_and_slide()
	else:
		position.x = target.x
