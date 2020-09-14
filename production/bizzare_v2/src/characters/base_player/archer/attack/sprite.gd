extends Sprite


func _ready():
	rotation = get_angle_to(get_tree().get_root().get_node("Game/level/player/crosshair").global_position)
	
