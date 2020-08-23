#
class_name BaseNPC
extends BaseChar

var loot_scene = preload("res://src/loot/coin.tscn")

func _ready() -> void:
	ACCEL = 300
	MAX_SPEED = 100
	DECEL = 200


func drop_loot() -> void:
	randomize()
	var random = randi() % 100 + 1
	print(random)
	if random <= 50:
		var loot = loot_scene.instance()
		loot.global_position = global_position
		get_node("../").add_child(loot)


func die() -> void:
	.die()
	drop_loot()
