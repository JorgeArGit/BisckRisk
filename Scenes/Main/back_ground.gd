extends ParallaxBackground


func _physics_process(delta: float) -> void:
	scroll_offset += Vector2(1, -1) * delta * 20.0
