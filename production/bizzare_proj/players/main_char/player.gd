extends KinematicBody2D

const ACCEL = 2000
const MAX_SPEED = 300
const DECEL = 2000

var velocity

func _ready():
	velocity = Vector2.ZERO	

func accelerate(delta, input_vector):
	return velocity.move_toward(input_vector * MAX_SPEED, ACCEL * delta)
	
func decelerate(delta):
	return velocity.move_toward(Vector2.ZERO, DECEL * delta)
	
func get_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input_vector.normalized()
	
func _physics_process(delta):
	var input_vector = get_input_vector()
	velocity = decelerate(delta) if input_vector == Vector2.ZERO else accelerate(delta, input_vector)
	velocity = move_and_slide(velocity)

func _process(delta):
	pass#get_node("MeleeAttack").attack_process(delta)
