extends GridContainer
class_name DiceContainer

func get_is_rolling() -> bool:
	for dice: Dice in get_children():
		return false
	return true
