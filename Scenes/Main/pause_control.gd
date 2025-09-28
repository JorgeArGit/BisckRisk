extends TextureButton

@export var on: Texture2D 
@export var off: Texture2D 
@export var main: Main
@onready var game: Control = $"../Game"
@onready var menu: Control = $"../Menu"
var is_paused: bool = true

func _on_button_down() -> void:
	scale = Vector2(0.9, 0.9)

func _on_button_up() -> void:
	scale = Vector2(1.0, 1.0)

func _on_pressed() -> void:
	if is_paused:
		is_paused = false
		texture_normal = on
		game.visible = true
		menu.visible = false
		main.process_mode = Node.PROCESS_MODE_ALWAYS
	else:
		is_paused = true
		texture_normal = off
		game.visible = false
		menu.visible = true
		main.process_mode = Node.PROCESS_MODE_DISABLED
		
