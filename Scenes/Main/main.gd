extends Node
class_name Main

@onready var ui: UI = $UI
@onready var dice_container: DiceContainer = $UI/Game/Container/DiceContainer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $Timer
@onready var difficulty_manager: DifficultyManager = $DifficultyManager
@onready var win_screen: Control = $UI/WinScreen
@onready var game: Control = $UI/Game
@onready var menu: Control = $UI/Menu
@onready var turn_pause: TextureButton = $UI/TurnPause
@export var wait_between_roll: float

var is_rolling: bool = false
var total_value: int = 0
var current_roll: int
var last_roll: int
var can_roll: bool = true
var money: int = 0
signal buy_biscuit

func load_game() -> void:
	connect_dice($UI/Game/Container/DiceContainer/Dice)
	do_roll()

func connect_dice(dice: Dice) -> void:
	dice.dice_ended.connect(func(value: int) -> void:
		total_value += value
		if dice_container.get_child(dice_container.get_child_count() - 1) == dice:
			set_current_roll(total_value)
			is_rolling = false
			total_value = 0
		)
	dice.dice_rolled.connect(func() -> void:
		is_rolling = true
		)

func set_money(value: int) -> void:
	money = value
	ui.update_money_label(money)
	if money == 100:
		buy_biscuit.emit()
	
func set_current_roll(value: int) -> void:
	current_roll = value
	
func do_roll() -> void:
	if !is_rolling:
		difficulty_manager.add_difficulty()
		is_rolling = true
		for dice: Dice in dice_container.get_children():
			dice.roll()
		last_roll = current_roll 
		ui.update_last_roll_label(last_roll)
		timer.start()

func _on_timer_timeout() -> void:
	set_money(money - 1)
	do_roll()

func _on_biscuit_pressed() -> void:
	audio_stream_player.play()
	win_screen.visible = true
	game.visible = false
	menu.visible = false
	turn_pause.visible = false
	turn_pause.process_mode = Node.PROCESS_MODE_DISABLED
	menu.process_mode = Node.PROCESS_MODE_DISABLED
	process_mode = Node.PROCESS_MODE_DISABLED
