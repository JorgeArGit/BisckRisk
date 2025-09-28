extends Resource
class_name DiceStats

@export_enum("D6", "D4", "D8", "D10", "D20", "D100", "D1000", "DBiscuit")
var type: String = "D6"
@export var max: int = 0
@export var color: Color
@export_multiline var description: String
@export var cost: int
@export var shader: Shader
