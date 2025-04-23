extends Node2D

var score: int = 0

func _ready() -> void:
	Signals.increment_score.connect(increment_score)

func increment_score(increment: int):
	score += increment
	%ScoreLabel.text = str(score) +  " Score"
