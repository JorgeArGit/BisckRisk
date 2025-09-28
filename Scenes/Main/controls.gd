extends VBoxContainer

@export var main: Main
@onready var higher: Button = $Higher
@onready var lower: Button = $Lower
@onready var biscuit: Button = $Biscuit
@onready var timer: Timer = $"../../../../Timer"

func _ready() -> void:
	higher.pivot_offset = Vector2(34.0, 24.0)
	lower.pivot_offset = Vector2(34.0, 24.0)
	biscuit.pivot_offset = Vector2(34.0, 24.0)
	for button: Button in get_children():
		button.button_down.connect(func() -> void:
			button.scale = Vector2(0.9, 0.9))
		button.button_up.connect(func() -> void:
			button.scale = Vector2(1.0, 1.0))
	main.buy_biscuit.connect(func() -> void:
		biscuit.visible = true)

func _on_higher_pressed() -> void:
	main.audio_stream_player.pitch_scale = randf_range(1.0, 1.2)
	main.audio_stream_player.play()
	if !main.is_rolling:
		if main.current_roll >= main.last_roll:
			print("You won!")
			main.set_money(main.money + 1)
		else:
			print("You lost!")
			main.set_money(main.money - 1)
		timer.start()
		main.do_roll()

func _on_lower_pressed() -> void:
	main.audio_stream_player.pitch_scale = randf_range(0.8, 1.0)
	main.audio_stream_player.play()
	if !main.is_rolling:
		if main.current_roll <= main.last_roll:
			print("You won!")
			main.set_money(main.money + 1)
		else:
			print("You lost!")
			main.set_money(main.money - 1)
		timer.start()
		main.do_roll()
