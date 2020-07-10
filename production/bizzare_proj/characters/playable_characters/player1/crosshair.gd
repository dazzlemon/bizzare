extends Position2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	global_position = Vector2.ZERO

func _process(_delta):
	position = get_node("sprite").get_viewport().get_mouse_position()
	
	var body_cross_dir = get_node("../MeleeAttack").get_angle_to(get_global_mouse_position())
	get_node("../MeleeAttack").rotation += body_cross_dir
