extends Node2D

var score: int = 0
var combo_count: int = 0

func _ready() -> void:
	Signals.increment_score.connect(increment_score)
	Signals.increment_combo.connect(increment_combo)
	Signals.reset_combo.connect(reset_combo)
	
	reset_combo()

func increment_score(increment: int):
	score += increment
	%ScoreLabel.text = str(score) +  " Score"

func increment_combo():
	combo_count += 1 
	%ComboLabel.text = str(combo_count) + "x combo"

func reset_combo():
	combo_count = 0
	%ComboLabel.text = ""
