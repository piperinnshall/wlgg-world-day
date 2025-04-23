extends Node2D

# perfect cf573c
# great e6dd25
# good a7dd25
# ok 8dbfc7
# miss 5a5758

func set_text(text: String):
	$ScoreTextLabel.text = text

	match text:
		"PERFECT":
			$ScoreTextLabel.set("theme_override_colors/default_color", Color("cf573c"))
		"GREAT":
			$ScoreTextLabel.set("theme_override_colors/default_color", Color("e6dd25"))
		"GOOD":
			$ScoreTextLabel.set("theme_override_colors/default_color", Color("a7dd25"))
		"OK":
			$ScoreTextLabel.set("theme_override_colors/default_color", Color("8dbfc7"))
		"_":
			$ScoreTextLabel.set("theme_override_colors/default_color", Color("cf573c"))
		
