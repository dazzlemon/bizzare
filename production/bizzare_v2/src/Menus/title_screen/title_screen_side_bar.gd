extends Menu

func _ready():
	separation = 15
	buttons = [
		Menu_Button.new("Play", "play"),
		Menu_Button.new("Settings", "settings"),
		Menu_Button.new("Quit", "quit"),
	]
	._ready()

func play():
	get_tree().change_scene("res://src/levels/Game.tscn")

func quit():
	get_tree().quit()
