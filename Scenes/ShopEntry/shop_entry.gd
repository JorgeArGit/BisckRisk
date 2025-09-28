extends Control
class_name ShopEntry

@export var stats: DiceStats
@onready var label: Label = $Container/Label
@onready var image: TextureRect = $Container/Image
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var can_buy: bool = false

var type: String
var max: int = 0
var color: Color
var description: String
var cost: int
var is_mouse: bool = false
var shader: Shader

signal dice_selected(stats: DiceStats)

func _ready() -> void:
	type = stats.type
	max = stats.max
	color = stats.color
	description = stats.description
	cost = stats.cost
	label.text = description + "\n" + "Cost: " + str(cost)
	image.modulate = color
	shader = stats.shader
	var new_material: ShaderMaterial = ShaderMaterial.new()
	new_material.shader = shader
	image.material = new_material
	if type == "D1000":
		animation_player.play("rainbow")

func _on_mouse_entered() -> void:
	audio_stream_player.pitch_scale = randf_range(0.9, 1.1)
	audio_stream_player.play()
	is_mouse = true
	scale = Vector2(1.1, 1.1)

func _on_mouse_exited() -> void:
	is_mouse = false
	scale = Vector2(1, 1)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and is_mouse:
		dice_selected.emit(stats)
