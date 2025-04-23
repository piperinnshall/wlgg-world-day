extends RichTextLabel


func _on_menu_button_button_down() -> void:
	position += Vector2(0,3)
	
	


func _on_menu_button_button_up() -> void:
	position += Vector2(0,-3)
