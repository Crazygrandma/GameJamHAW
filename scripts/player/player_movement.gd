class_name player

extends CharacterBody2D

@export var playerSpeed = 200.0

@export var targetMinX = -2000
@export var targetMaxX = 2000

@onready var cat_animation = $CatAnimation
@onready var facing_left = $facingLeft
@onready var timer = $Timer

@onready var area_2d = $"../Area2D"


var target = Vector2()
var facing: bool = false
var jumping: bool = false
var facingRight = false

func _ready():
	target = position
	

func _input(event):
	if event.is_action_pressed("leftMouseClick"):
		target = get_global_mouse_position()

func processAnimation():
	if jumping:
		if facingRight:
			cat_animation.show()
			cat_animation.play("Jump_R")
			facing_left.hide()
		else:
			facing_left.show()
			facing_left.play("Jump_L")
			cat_animation.hide()
		return
	
	
	if velocity.x > 0: #walking and player behavior
		# Player moves to the right
		facingRight = true
		cat_animation.show()
		cat_animation.play("Walk_R")
		facing_left.hide()
	elif velocity.x < 0:
		facingRight = false
		facing_left.show()
		facing_left.play("Walk_L")
		cat_animation.hide()
	else:
		## Player standing still
		if facingRight: #idle animation
			cat_animation.show()
			cat_animation.play("Idle_R")
			facing_left.hide()
		else:
			facing_left.show()
			facing_left.play("Idle_L")
			cat_animation.hide()

func _process(_delta):
	processAnimation()
	processMovement()
		

func processMovement():
	if target.x < targetMinX:
		target.x = targetMinX
		
	if target.x > targetMaxX:
		target.x = targetMaxX
		
	if not jumping:
		# If player is not jumping
		
		target.x = target.x 
		target.y = position.y
		velocity = position.direction_to(target) * playerSpeed
		
		# Snapping to pos (floating error)
		if position.distance_to(target) > 10:
			move_and_slide()
		else:
			position.x = target.x
			velocity.x = 0
	else:
		
		velocity = position.direction_to(target) * playerSpeed
		if position.distance_to(target) > 10:
			move_and_slide()
		else:
			# Snap to pos
			jumping = false
			position = target
					
		
func jumpTo(targetPos):
	jumping = true
	target = targetPos
	
