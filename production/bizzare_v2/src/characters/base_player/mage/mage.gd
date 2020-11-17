class_name Mage
extends BasePlayer

func _ready():
	MAX_SPEED = 100
	unit_type = Animations.new(1, 1)#"idle_run"


func _physics_process(delta):
	._physics_process(delta)
