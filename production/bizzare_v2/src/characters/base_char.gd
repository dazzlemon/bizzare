# all ingame characters superclass
class_name BaseChar
extends KinematicBody2D

export var DMG_BLOCK: float = 0
export var ACCEL: float = 2000
export var DECEL: float = 2000
export var MAX_SPEED: float = 300# all of these have to be const, but changeable for inherited classes


var velocity := Vector2.ZERO
var state = States.FRICTION

onready var animation_player = $AnimationPlayer
onready var stats = $stats
onready var control = $control
onready var spell_1 = $spell_1
onready var spell_2 = $spell_2
onready var crosshair = $crosshair
onready var animation_tree = $AnimationTree
onready var attack_player = $AttackPlayer


enum States {
	KNOCKED_BACK,
	FRICTION,
	NO_FRICTION,
}
#enum and const prolly could be merged into one object
const state_funcs = {
	States.KNOCKED_BACK : "knocked_back",
	States.FRICTION : "friction",
	States.NO_FRICTION : "no_friction",
}

func accelerate(delta: float, speed: Vector2, input_vector: Vector2) -> Vector2:
	return speed.move_toward(input_vector * MAX_SPEED, ACCEL * delta)


func decelerate(delta: float, speed: Vector2) -> Vector2:
	return speed.move_toward(Vector2.ZERO, DECEL * delta)


func _physics_process(delta: float) -> void:
	call(state_funcs[state], delta, control.get_input_vector())


func knocked_back(delta, input_vector):
	velocity = move_and_slide(decelerate(delta, velocity))
	if velocity == Vector2.ZERO:
		state = States.NO_FRICTION


func friction(delta, input_vector):
	if input_vector == Vector2.ZERO:
		velocity = move_and_slide(decelerate(delta, velocity))
	else:
		velocity = move_and_slide(accelerate(delta, velocity, input_vector))


func no_friction(delta, input_vector):
	velocity = Vector2.ZERO
	move_and_slide(input_vector * MAX_SPEED)


func _on_stats_no_health() -> void:
	die()


func take_damage(damage: float) -> void:
	if stats.armor > 0:
		stats.armor -= 0.7 * damage * (1 - DMG_BLOCK)#prolly need to make 0.7 as a variable
	else:
		stats.health -= damage * (1 - DMG_BLOCK)


func die() -> void:
	queue_free()


func _on_hurtbox_area_entered(area) -> void:#hitscan hitreg
	if area is KnightAOEHitbox:
		state = States.KNOCKED_BACK
		velocity = area.knockback(self)
	if area is BaseHitscanHitbox:
		take_damage(area.damage)


func _on_hurtbox_body_entered(body) -> void:#projectile hitreg
	if body is BaseProjectile:
		take_damage(body.damage)
		body.die()
