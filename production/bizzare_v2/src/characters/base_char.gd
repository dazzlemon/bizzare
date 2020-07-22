# all ingame characters superclass
class_name BaseChar
extends KinematicBody2D

export var DMG_BLOCK = 0
export var ACCEL = 2000
export var DECEL = 2000
export var MAX_SPEED = 300# all of these have to be const, but changeable for inherited classes

var knockback := Vector2.ZERO
var velocity := Vector2.ZERO


onready var stats = $stats
onready var control = $control#prolly dont need static typing


func accelerate(delta: float, input_vector: Vector2) -> Vector2:
	return velocity.move_toward(input_vector * MAX_SPEED, ACCEL * delta)


func decelerate(delta: float) -> Vector2:
	return velocity.move_toward(Vector2.ZERO, DECEL * delta)


func _physics_process(delta: float) -> void:
	var input_vector: Vector2 = control.get_input_vector()#:=
	velocity = decelerate(delta) if input_vector == Vector2.ZERO else accelerate(delta, input_vector)
	velocity = move_and_slide(velocity)
	#####################
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)


func _on_stats_no_health() -> void:
	die()


func take_damage(damage) -> void:#idk type of damage, prolly float/int
	if stats.armor > 0 :
		stats.armor -= 0.7 * damage * (1 - DMG_BLOCK)#prolly need to make 0.7 as a variable
		if stats.armor < 0 :
			stats.health += stats.armor
			stats.set_armor(0)
	else:
		stats.health -= damage * (1 - DMG_BLOCK)
	print("hp:", stats.health)#DEBUG---------------------------
	print("armor", stats.armor)#DEBUG--------------------------


func die() -> void:
	queue_free()


func _on_hurtbox_area_entered(area):
	if area is KnightAOEHitbox :
		knockback =  area.knockback(self)
	else:
		pass
