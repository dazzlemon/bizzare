class_name Apprentice
extends BaseNPCRange

onready var player_detection_zone = control.player_detection_zone#src/characters/base_npc/range/harpy_boss/apprentices/apprentice_ray_hitscan_process.gd line6

func _ready():
	animation_player.play("process")

func _process(delta):
	position = position.rotated(delta)

func drop_loot():
	pass

func _on_stats_no_health():
	pass

func take_damage(damage: float) -> void:
	stats.health -= 1
