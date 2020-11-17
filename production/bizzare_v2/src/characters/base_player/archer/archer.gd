#
class_name Archer
extends BasePlayer

onready var attack = get_node("attack")
onready var timer = get_node("AttackPlayer/Timer")
onready var attack_player = $AttackPlayer
#onready var spell_1 = get_node("spell_1")


func _ready():
	MAX_SPEED = 100
	unit_type = Animations.new(1, 1)#"idle_run"


func _physics_process(delta):
	._physics_process(delta)
	if Input.is_action_pressed("attack") or Input.is_action_pressed("spell_1") : #NEED TO FIX "Q" Trigering attack animation , when spell isn't ready
		attack_player.play("attack")

