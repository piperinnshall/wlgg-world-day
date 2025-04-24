extends Control

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/nodes/main_menu.tscn")
