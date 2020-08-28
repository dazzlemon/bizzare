extends RayHitscanProcess

func _ready():
	crosshair = double_up.get_parent().crosshair#harpy boss' crosshair
	player_detection_zone = double_up.player_detection_zone#src/characters/base_npc/range/harpy_boss/apprentices/apprentice.gd line4


func _process(delta):
	._process(delta)
	cast_to = crosshair.global_position - double_up.global_position
