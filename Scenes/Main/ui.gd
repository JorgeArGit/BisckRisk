extends CanvasLayer
class_name UI

@onready var money_label: Label = $Game/MoneyLabel
@onready var last_roll_label: Label = $Game/LastRollLabel
@onready var progress_bar: ProgressBar = $Game/ProgressBar
@onready var timer: Timer = $"../Timer"

func _ready() -> void:
	progress_bar.max_value = timer.wait_time
	progress_bar.value = timer.time_left
	
func update_money_label(value: int) -> void:
	money_label.text = str(value) + "/100$"

func update_last_roll_label(value: int) -> void:
	last_roll_label.text = "Last roll: " + str(value)

func _physics_process(_delta: float) -> void:
	progress_bar.value = timer.time_left
