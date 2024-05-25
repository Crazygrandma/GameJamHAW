extends CharacterBody2D

@export var playerSpeed = 200.0
@onready var sprite_2d = $Sprite2D
@onready var MamaCat = $AnimatedSprite2D
@onready var CatMama = $facingLeft

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
	
	if target.x > position.x: #walking and player behavior
		# Player moves to the right
		MamaCat.play("Walk_R")
		CatMama.play("Hide")
	elif target.x < position.x:
		CatMama.play("Walk_L")
		MamaCat.play("Hide")
	else:
		if facing == true: #idle animation
			CatMama.play("Idle_L")
			MamaCat.play("Hide")
		else:
			MamaCat.play("Idle_R")
			CatMama.play("Hide")
	
	
	
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
