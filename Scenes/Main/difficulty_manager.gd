extends Node
class_name DifficultyManager

@onready var main: Node = get_parent()
var dice_scene: PackedScene = preload("res://Scenes/Dice/dice.tscn")
var d6: DiceStats = preload("res://Scenes/Dice/DiceSheets/d6.tres")
var d10: DiceStats = preload("res://Scenes/Dice/DiceSheets/d10.tres")
var d20: DiceStats = preload("res://Scenes/Dice/DiceSheets/d20.tres")
var d100: DiceStats = preload("res://Scenes/Dice/DiceSheets/d100.tres")
var d1000: DiceStats = preload("res://Scenes/Dice/DiceSheets/d1000.tres")

func spawn_dice(stats: DiceStats) -> void:
	var new_dice: Dice = dice_scene.instantiate()
	new_dice.stats = stats
	main.connect_dice(new_dice)
	main.dice_container.add_child(new_dice)

func add_difficulty() -> void:
	if main.money == 5 and main.dice_container.get_child_count() < 2:
		spawn_dice(d6)
	elif main.money == 10 and main.dice_container.get_child_count() < 3:
		spawn_dice(d6)
	elif main.money == 15 and main.dice_container.get_child_count() < 4:
		spawn_dice(d10)
	elif main.money == 20 and main.dice_container.get_child_count() < 5:
		spawn_dice(d10)
	elif main.money == 25 and main.dice_container.get_child_count() < 6:
		spawn_dice(d10)
	elif main.money == 30 and main.dice_container.get_child_count() < 7:
		spawn_dice(d20)
	elif main.money == 35 and main.dice_container.get_child_count() < 8:
		spawn_dice(d20)
	elif main.money == 40 and main.dice_container.get_child_count() < 9:
		spawn_dice(d20)
	elif main.money == 45 and main.dice_container.get_child_count() < 10:
		spawn_dice(d100)
	elif main.money == 50 and main.dice_container.get_child_count() < 11:
		spawn_dice(d100)
	elif main.money == 55 and main.dice_container.get_child_count() < 12:
		spawn_dice(d100)
	elif main.money == 60 and main.dice_container.get_child_count() < 13:
		spawn_dice(d1000)
	elif main.money == 65 and main.dice_container.get_child_count() < 14:
		spawn_dice(d1000)
	elif main.money == 70 and main.dice_container.get_child_count() < 15:
		spawn_dice(d1000)
