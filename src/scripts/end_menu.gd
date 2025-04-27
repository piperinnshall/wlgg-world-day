extends Control

func _ready() -> void:
	# Connect to the high score signal
	Signals.high_score.connect(high_score)
	
	# Set initial display
	%HighScoreLabel.text = "High Score: 0"

func high_score(new_high_score: int) -> void:
	%HighScoreLabel.text = "HIGH SCORE: " + str(new_high_score)

func on_quit_pressed() -> void:
	get_tree().quit()

func on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/stages/main_menu.tscn")
