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

var drop_rates = {
	"health_orb_scene" : 10,
	"damage_orb_scene" : 10,
	"armor_orb_scene" : 10,
	"money_orb_scene" : 10,
	"small_hp_restore" : 10,
	"big_hp_restore" : 10,
	"small_armor_restore" : 10,
	"full_restore" : 10,
	"big_armor_restore" : 10,
}


func _ready() -> void:
	ACCEL = 300
	MAX_SPEED = 100
	DECEL = 200


func _physics_process(delta):
	._physics_process(delta)
	if velocity != Vector2.ZERO:
		crosshair.global_position = global_position + velocity.normalized()


func drop_loot() -> void:
	randomize()
	_try_coins()
	_try_drop()


func _try_drop():
	var random = randi() % 100 + 1
	print(random)########################DEBUG
	var chance = 0
	for drop in drop_rates:
		chance += drop_rates[drop]
		if random <= chance:
			spawn_instance(get(drop))
			break

func _try_coins():
	var coins_random = randi() % 5 + 1
	print(coins_random)##################DEBUG
	if coins_random == 1:
		pass
	elif coins_random == 2:
		spawn_instance(currency_coins_scene)
	elif coins_random == 3:
		spawn_instance(currency_coins_scene)
		spawn_instance(currency_coins_scene)
	elif coins_random == 4:
		spawn_instance(currency_bag_scene)
	elif coins_random == 5: 
		spawn_instance(currency_bag_scene)
		spawn_instance(currency_coins_scene)


func spawn_instance(url) -> void:
	var instance = url.instance()
	instance.global_position = global_position 
	get_node("../").call_deferred("add_child", instance)


func die() -> void:
	.die()
	drop_loot()
