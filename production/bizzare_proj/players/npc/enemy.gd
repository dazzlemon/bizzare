extends  KinematicBody2D

onready var stats = $Stats
var loot_scene = preload("res://players/npc/Coin.tscn")

func _ready():
	randomize()


 

func _on_hurtbox_area_entered(area):
	stats.health -= area.damage
	print("hp:" , stats.health)

func _on_Stats_no_heatlh():
	queue_free()
	var random = randi() % 100 + 1
	print(random)
	if random <= 50:
		print("<=50")
		var loot = loot_scene.instance()
		loot.global_position=global_position
		get_tree().get_root().add_child(loot)
	else:
		print(">50")

