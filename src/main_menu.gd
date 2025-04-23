extends Control


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/nodes/LevelMenu.tscn")




func _on_quit_pressed() -> void:
	get_tree().quit()
