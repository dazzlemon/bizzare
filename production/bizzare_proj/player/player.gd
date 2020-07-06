extends KinematicBody2D

const ACCEL = 2000
const MAX_SPEED = 300
const DECEL = 2000

var velocity
 
enum{
	MOVE,
	ATTACK
}

var state = MOVE

func _ready():
	velocity= Vector2.ZERO
	
func _physics_process(delta):

	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCEL * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, DECEL * delta)
	
	velocity = move_and_slide(velocity)
	if Input.is_action_just_pressed("attack"):
		print("-5hp")
		get_node("CollisionShape2D").disabled= true
