#
class_name BaseNPC
extends BaseChar

var currency_bag_scene = preload("res://src/loot/currency/currency_bag.tscn")
var currency_coins_scene = preload("res://src/loot/currency/currency_coins.tscn")
var health_orb_scene = preload("res://src/loot/health_orb/health_orb.tscn")
var damage_orb_scene = preload("res://src/loot/damage_orb/damage_orb.tscn")
var armor_orb_scene = preload("res://src/loot/armor_orb/armor_orb.tscn")
var money_orb_scene = preload("res://src/loot/money_orb/money_orb.tscn")
var small_hp_restore = preload("res://src/loot/restore/small_health_restore/small_health_restore.tscn")
var big_hp_restore = preload("res://src/loot/restore/big_health_restore/big_health_restore.tscn")
var small_armor_restore = preload("res://src/loot/restore/small_armor_restore/small_armor_restore.tscn")
var big_armor_restore = preload("res://src/loot/restore/big_armor_restore/big_armor_restore.tscn")
var full_restore = preload("res://src/loot/restore/full_restore/full_restore.tscn")


func _ready() -> void:
	ACCEL = 300
	MAX_SPEED = 100
	DECEL = 200


func drop_loot() -> void:
	randomize()
	var random = randi() % 100 + 1
	print(random)
	if random > 2 and random < 3 :
		spawn_instance(currency_bag_scene)
#	elif random > 4 and random < 5 :
#		spawn_instance(currency_coins_scene)
#	elif random > 60 and random < 70: 
#		spawn_instance(health_orb_scene)
#	elif random > 80 and random < 90:
#		spawn_instance(damage_orb_scene)
#	elif random > 70 and random < 80:
#		spawn_instance(armor_orb_scene)
#	elif random > 4 and random <50:
#		spawn_instance(money_orb_scene)
#	elif random > 4 and random <50:
#		spawn_instance(small_hp_restore)
#	else:
#		spawn_instance(big_hp_restore)
#	elif random > 4 and random <50:
#		spawn_instance(small_armor_restore)
	elif random > 4 and random <50:
		spawn_instance(full_restore)
	else:
		spawn_instance(big_armor_restore)


func spawn_instance(url) -> void:
	var instance = url.instance()
	instance.global_position = global_position
	get_node("../").add_child(instance)


func die() -> void:
	.die()
	drop_loot()
