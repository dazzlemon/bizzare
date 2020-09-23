#
class_name Archer
extends BasePlayer

onready var attack = get_node("attack")
onready var timer = get_node("AttackPlayer/Timer")

var checker = false

func _ready():
	MAX_SPEED = 150


func _physics_process(delta):
	if control.get_input_vector() != Vector2.ZERO:
		animation_tree["parameters/archer_idles/blend_position"] = control.get_input_vector()
		animation_tree["parameters/archer_run/blend_position"] = control.get_input_vector()
		animation_tree.get("parameters/playback").travel("archer_run")
	else:
		animation_tree.get("parameters/playback").travel("archer_idles")
	._physics_process(delta)
	if Input.is_action_pressed("attack") or Input.is_action_pressed("spell_1") : #and attack._is_able_to_use(): #and checker == true:
		attack_player.play("attack")
		#checker = false


#func _on_AttackPlayer_animation_finished(anim_name):
#	checker = true
