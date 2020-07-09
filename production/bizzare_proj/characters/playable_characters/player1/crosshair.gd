extends Position2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	global_position = Vector2.ZERO

func _process(_delta):
	position = get_node("sprite").get_viewport().get_mouse_position()
	
	var body_cross_vec = get_node("../").global_position - global_position 
	var rad = body_cross_vec.angle()
	get_node("../MeleeAttack").rotation = rad#it doesn't work idk why
