extends "res://src/characters/base_char.gd"

var loot_scene = preload("res://src/loot/Coin.tscn")

func _ready():
	ACCEL = 300
	MAX_SPEED = 100
	DECEL = 200

func drop_loot():
	var random = randi() % 100 + 1
	print(random)
	if random <= 50:
		print("<=50")
		var loot = loot_scene.instance()
		loot.global_position = global_position
		get_node("../").add_child(loot)
	else:
		print(">50")

func die():
	.die()
	drop_loot()
