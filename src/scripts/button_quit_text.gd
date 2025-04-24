extends RichTextLabel

func _on_quit_button_up() -> void:
	position += Vector2(0,-3)

func _on_quit_button_down() -> void:
	position += Vector2(0,3)
