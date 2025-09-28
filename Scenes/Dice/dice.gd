extends Control
class_name Dice

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var body: AnimatedSprite2D = $Body
@onready var label: Label = $Label
@onready var texture_button: TextureButton = $TextureButton
@export var stats: DiceStats

var type: String
var max: int = 0
var color: Color
var can_roll: bool = true
var shader: Shader
var cost: int
var roll_sounds: Array[AudioStream] = [
preload("res://Assets/Sounds/die-throw-1.wav"), 
preload("res://Assets/Sounds/die-throw-2.wav"),
preload("res://Assets/Sounds/die-throw-3.wav"), 
preload("res://Assets/Sounds/die-throw-4.wav")
]
signal dice_rolled
signal dice_ended(value: int)
signal pressed

func _ready() -> void:
	type = stats.type
	max = stats.max
	color = stats.color
	body.modulate = color
	#shader = stats.shader
	cost = stats.cost
	#var new_material: ShaderMaterial = ShaderMaterial.new()
	#new_material.shader = shader
	#body.material = new_material
	if stats.type == "D1000":
		animation_player.play("rainbow")
	
func roll() -> void:
	if can_roll:
		dice_rolled.emit()
		can_roll = false
		label.visible = false
		var value: int = randi_range(1, max)
		audio_stream_player.pitch_scale = randf_range(0.9, 1.1)
		audio_stream_player.stream = roll_sounds.pick_random()
		audio_stream_player.play()
		animation_player.play("rotate")
		body.play("roll")
		await animation_player.animation_finished
		audio_stream_player.stop()
		animation_player.stop()
		if value <= 6:
			body.play(str(value))
		else:
			label.text = str(value)
			label.visible = true
			body.play("blank")
		dice_ended.emit(value)
		can_roll = true
		if stats.type == "D1000":
			animation_player.play("rainbow")
		
func _physics_process(_delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	pressed.emit()

func _on_texture_button_mouse_entered() -> void:
	print(true)
	body.scale = Vector2(1.1, 1.1)

func _on_texture_button_mouse_exited() -> void:
	print(false)
	body.scale = Vector2(1.0, 1.0)
