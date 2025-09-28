extends Control

@onready var button: Button = $Button
@onready var game: Control = $"../Game"
@onready var audio_stream_player: AudioStreamPlayer = $"../../AudioStreamPlayer"
@onready var turn_pause: TextureButton = $"../TurnPause"
@onready var label: Label = $Label
@export var main: Main

var is_first: bool = true

func _ready() -> void:
	button.pivot_offset = Vector2(50.0, 24.0)

func _on_button_button_down() -> void:
	button.scale = Vector2(0.9, 0.9)

func _on_button_button_up() -> void:
	button.scale = Vector2(1.0, 1.0)

func _on_button_pressed() -> void:
	audio_stream_player.play()
	main.process_mode = Node.PROCESS_MODE_ALWAYS
	if is_first:
		main.load_game()
		is_first = false
		turn_pause.visible = true
		button.text = "CONTINUE"
	game.visible = true
	turn_pause.is_paused = false
	visible = false
	
