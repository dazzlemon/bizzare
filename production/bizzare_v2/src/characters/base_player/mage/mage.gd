class_name Mage
extends BasePlayer

#onready var attack = get_node("attack")
#onready var timer = get_node("AttackPlayer/Timer")

#var checker = false

func _ready():
	MAX_SPEED = 125


func _physics_process(delta):
	animation_tree["parameters/mage_idles/blend_position"] = (crosshair.global_position - global_position).normalized()
	animation_tree["parameters/mage_run/blend_position"] = (crosshair.global_position - global_position).normalized()
	if control.get_input_vector() != Vector2.ZERO:
		animation_tree.get("parameters/playback").travel("mage_run")
	else:
		animation_tree.get("parameters/playback").travel("mage_idles")
	._physics_process(delta)
#	if Input.is_action_pressed("attack") or Input.is_action_pressed("spell_1") : 
#		attack_player.play("attack")
