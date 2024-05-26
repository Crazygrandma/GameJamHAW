extends HSlider

@onready var btn_click_sound = $"../../../HBoxContainer/VBoxContainer/Btn_Click_Sound"

@export
var bus_name = "Sfx"

var bus_index: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	print(bus_name)
	value_changed.connect(_on_value_changed)
	
func _on_value_changed(value: float) -> void:
	btn_click_sound.play()
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)		
	)
