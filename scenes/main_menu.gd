class_name MainMenu

extends Control

@onready var btn_start = $MarginContainer/HBoxContainer/VBoxContainer/Btn_Start as Button
@onready var btn_quit = $MarginContainer/HBoxContainer/VBoxContainer/Btn_Quit as Button
@onready var start_level = preload("res://scenes/level_1.tscn") as PackedScene
@onready var btn_click_sound = $MarginContainer/HBoxContainer/VBoxContainer/Btn_Click_Sound as AudioStreamPlayer2D
@onready var btn_quit_sound = $MarginContainer/HBoxContainer/VBoxContainer/Btn_Quit_Sound as AudioStreamPlayer2D
@onready var catharina_pic = $catharinaPic as TextureRect
@onready var btn_abspann = $MarginContainer/HBoxContainer/VBoxContainer/Btn_abspann as Button
@onready var credits_level = preload("res://scenes/Credits.tscn") as PackedScene
@onready var OUTRO = preload("res://scenes/Outro.tscn") as PackedScene
@onready var INTRO = preload("res://scenes/Intro.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	catharina_pic.visible = true
	await get_tree().create_timer(3).timeout
	catharina_pic.visible = false
	btn_start.button_down.connect(on_start_pressed)
	btn_quit.button_down.connect(on_quit_pressed)
	btn_abspann.button_down.connect(on_abspann_pressed)
	
func on_abspann_pressed() -> void:
	btn_click_sound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_packed(OUTRO)

# Called when quit button is pressed
func on_quit_pressed() -> void:
	btn_quit_sound.play()
	await get_tree().create_timer(0.8).timeout
	get_tree().quit()

# Called when start button is pressed
func on_start_pressed() -> void:
	btn_click_sound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_packed(INTRO)

