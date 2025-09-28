extends Control

@onready var button: Button = $Button
@onready var audio_stream_player: AudioStreamPlayer = $"../../AudioStreamPlayer"

func _ready() -> void:
	button.pivot_offset = Vector2(50.0, 24.0)

func _on_button_button_down() -> void:
	button.scale = Vector2(0.9, 0.9)

func _on_button_button_up() -> void:
	button.scale = Vector2(1.0, 1.0)

func _on_button_pressed() -> void:
	audio_stream_player.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Scenes/Main/main.tscn")
