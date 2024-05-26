class_name Credits

extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(10).timeout
	get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
