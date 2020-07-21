extends KinematicBody2D

onready var stats = $stats
onready var control = $control

export var DMG_BLOCK = 0
export var ACCEL = 2000
export var MAX_SPEED = 300
export var DECEL = 2000

var velocity

func _ready():
	velocity = Vector2.ZERO

func accelerate(delta, input_vector):
	return velocity.move_toward(input_vector * MAX_SPEED, ACCEL * delta)
	
func decelerate(delta):
	return velocity.move_toward(Vector2.ZERO, DECEL * delta)
	
func _physics_process(delta):
	var input_vector = control.get_input_vector()
	velocity = decelerate(delta) if input_vector == Vector2.ZERO else accelerate(delta, input_vector)
	velocity = move_and_slide(velocity)

func _on_stats_no_health():
	die()

func take_damage(damage):
	if stats.armor > 0 :
		stats.armor -= 0.7 * damage * (1 - DMG_BLOCK)
		if stats.armor < 0 :
			stats.health += stats.armor
			stats.set_armor(0)
	else:
		stats.health -= damage * (1- DMG_BLOCK)
	print("hp:", stats.health)#DEBUG---------------------------
	print("armor", stats.armor)#DEBUG--------------------------
	
func die():
	queue_free()
