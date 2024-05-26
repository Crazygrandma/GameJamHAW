class_name Outro

extends Control
@onready var cat_1 = $cat1 as TextureRect
@onready var cat_2 = $cat2 as TextureRect
@onready var cat_3 = $cat3 as TextureRect
@onready var cat_4 = $cat4 as TextureRect
@onready var outro_sound = $OutroSound as AudioStreamPlayer2D
@onready var CREDITS = preload("res://scenes/Credits.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	outro_sound.play();
	
	await get_tree().create_timer(3).timeout
	cat_1.visible = true
	await get_tree().create_timer(3).timeout
	cat_2.visible = true
	await get_tree().create_timer(6).timeout
	cat_3.visible = true
	await get_tree().create_timer(8).timeout
	cat_4.visible = true
	await get_tree().create_timer(5).timeout
	cat_1.visible = false
	cat_2.visible = false
	cat_3.visible = false
	cat_4.visible = false
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_packed(CREDITS)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
