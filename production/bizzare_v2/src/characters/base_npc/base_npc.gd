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
		spawn_instance(loot_scene)
	elif random >1 and random < 50  :
		spawn_instance(currency_bag_scene)
	else:
		spawn_instance(currency_coins_scene)


func spawn_instance(url) -> void:
	var instance = url.instance()
	instance.global_position = global_position
	get_node("../").add_child(instance)


func die() -> void:
	.die()
	drop_loot()
