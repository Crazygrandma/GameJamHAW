class_name MainMenu

extends Control

@onready var btn_start = $MarginContainer/HBoxContainer/VBoxContainer/Btn_Start as Button
@onready var btn_quit = $MarginContainer/HBoxContainer/VBoxContainer/Btn_Quit as Button
@onready var start_level = preload("res://scenes/level_1.tscn") as PackedScene
@onready var btn_click_sound = $MarginContainer/HBoxContainer/VBoxContainer/Btn_Click_Sound as AudioStreamPlayer2D
@onready var btn_quit_sound = $MarginContainer/HBoxContainer/VBoxContainer/Btn_Quit_Sound as AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	btn_start.button_down.connect(on_start_pressed)
	btn_quit.button_down.connect(on_quit_pressed)

# Called when quit button is pressed
func on_quit_pressed() -> void:
	btn_quit_sound.play()
	await get_tree().create_timer(0.8).timeout
	get_tree().quit()

# Called when start button is pressed
func on_start_pressed() -> void:
	btn_click_sound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_packed(start_level)

