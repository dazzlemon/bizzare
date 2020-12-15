class_name SlimeStats
extends BaseNPCStats

func _ready():
	max_health = 40 / get_node("../").count
	self.damage = 15
	._ready()

