extends TextureButton
class_name VolumeControl

var is_turn: bool = true
@export_enum("Sfx", "Music")
var bus: String = "Sfx"
@export var on: Texture2D 
@export var off: Texture2D 

func _ready() -> void:
	button_down.connect(func() -> void:
		scale = Vector2(0.9, 0.9)
		)
	button_up.connect(func() -> void:
		scale = Vector2(1.0, 1.0)
		)
	pressed.connect(func() -> void:
		if is_turn:
			is_turn = false
			texture_normal = off
			AudioServer.set_bus_mute(AudioServer.get_bus_index(bus), true)
		else:
			is_turn = true
			texture_normal = on
			AudioServer.set_bus_mute(AudioServer.get_bus_index(bus), false)
		)
