extends "res://characters/base_character.gd"

#var loot_scene = preload("res://loot/Coin.tscn")

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
	#drop_loot()
