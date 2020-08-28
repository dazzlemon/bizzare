extends RayHitscanProcess

func _ready():
	._ready()
	double_up = double_up.get_node("../../")


func _process(delta):
	._process(delta)
	cast_to = crosshair.global_position - double_up.global_position
