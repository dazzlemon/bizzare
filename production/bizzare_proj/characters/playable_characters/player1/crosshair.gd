extends Position2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	global_position = Vector2.ZERO

func _process(_delta):
	position = get_node("sprite").get_viewport().get_mouse_position()
	
	var melee_attack = get_node("../MeleeAttack")
	var body_cross_dir = melee_attack.get_angle_to(get_global_mouse_position())
	melee_attack.rotation += body_cross_dir
