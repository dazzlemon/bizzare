#
class_name BaseNPC
extends BaseChar

var loot_scene = preload("res://src/loot/coin.tscn")
var currency_bag_scene = preload("res://src/loot/currency/currency_bag.tscn")
var currency_coins_scene = preload("res://src/loot/currency/currency_coins.tscn")

func _ready() -> void:
	ACCEL = 300
	MAX_SPEED = 100
	DECEL = 200


func drop_loot() -> void:
	randomize()
	var random = randi() % 100 + 1
	print(random)
	if random <= 1:
		var loot = loot_scene.instance()
		loot.global_position = global_position
		get_node("../").add_child(loot)
	elif random >1 and random < 50  :
		var currency_bag = currency_bag_scene.instance()
		currency_bag.global_position = global_position
		get_node("../").add_child(currency_bag)
	else:
		var currency_coins = currency_coins_scene.instance()
		currency_coins.global_position = global_position
		get_node("../").add_child(currency_coins)

func die() -> void:
	.die()
	drop_loot()
