class_name Mage
extends BasePlayer

#onready var attack = get_node("attack")
#onready var timer = get_node("AttackPlayer/Timer")

#var checker = false

func _ready():
	MAX_SPEED = 125
	unit_type = Animations.new(1, 1)#"idle_run"

