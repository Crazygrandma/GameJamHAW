extends CharacterBody2D

@export var playerSpeed = 200.0
@onready var sprite_2d = $Sprite2D
@onready var MamaCat = $AnimatedSprite2D

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
	
	#if facing == true and target.x == position.x: #idle
		#MamaCat.play("Idle_L")
	#else:
		#MamaCat.play("Idle_R")
	
	if target.x > position.x: #walking and player behavior
		# Player moves to the right
		MamaCat.play("Walk_R")
	elif target.x < position.x:
		MamaCat.play("Walk_L")
	else:
		if facing == true: #idle animation
			MamaCat.play("Idle_L")
		else:
			MamaCat.play("Idle_R")
	
	
	
	target.y = position.y
	velocity = position.direction_to(target) * playerSpeed
	
	if velocity.x < 0:
		facing = true
	elif velocity.x > 0:
		facing = false
		
	if position.distance_to(target) > 10:
		move_and_slide()
	else:
		position.x = target.x
		velocity.x = 0
