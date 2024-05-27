class_name Intro

extends Control

@onready var intro_music = $IntroMusic as AudioStreamPlayer2D
@onready var levelOne = preload("res://scenes/level_1.tscn") as PackedScene
@onready var cat_1 = $cat1
@onready var cat_2 = $cat2
@onready var cat_3 = $cat3
@onready var cat_4 = $cat4
@onready var cat_5 = $cat5
@onready var cat_6 = $cat6
@onready var cat_7 = $cat7
@onready var btn_skip = $MarginContainer/VBoxContainer/Btn_Skip as Button

# Called when the node enters the scene tree for the first time.
func _ready():
	btn_skip.button_down.connect(on_skip_pressed)
	intro_music.play()
	#await get_tree().create_timer(0).timeout
	cat_1.visible = true
	await get_tree().create_timer(3).timeout
	cat_2.visible = true
	await get_tree().create_timer(9).timeout
	cat_1.visible = false
	cat_2.visible = false
	await get_tree().create_timer(3).timeout
	cat_3.visible = true
	await get_tree().create_timer(4).timeout
	cat_4.visible = true
	await get_tree().create_timer(4).timeout
	cat_5.visible = true
	await get_tree().create_timer(3).timeout
	cat_6.visible = true
	await get_tree().create_timer(3).timeout
	cat_7.visible = true
	await get_tree().create_timer(2.5).timeout
	get_tree().change_scene_to_packed(levelOne)

func on_skip_pressed() -> void:
	get_tree().change_scene_to_packed(levelOne)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
