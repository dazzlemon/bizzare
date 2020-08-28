class_name HarpyBossStats
extends BossStats


func _ready():
	max_health = 40
	health = max_health
	._ready()
	print(max_health)
	print(health)
