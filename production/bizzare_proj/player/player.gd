extends KinematicBody2D

const ACCEL = 2000
const MAX_SPEED = 300
const DECEL = 2000
const ATTACK_TIME_SEC = 0.25
const ATTACK_INTERVAL = 0.15

var velocity
var attack_active
var attack_active_timeleft_sec
var attack_wait_for_next_sec

func _ready():
	velocity = Vector2.ZERO	
	attack_active = false
	attack_wait_for_next_sec = 0
	get_node("HitboxPivot/swordhitbox/CollisionShape2D").disabled = true

func accelerate(delta, input_vector):
	return velocity.move_toward(input_vector * MAX_SPEED, ACCEL * delta)
	
func decelerate(delta):
	return velocity.move_toward(Vector2.ZERO, DECEL * delta)
	
func get_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input_vector.normalized()

func try_attack():
	get_node("HitboxPivot/swordhitbox/CollisionShape2D").disabled = not attack_active
	
func _physics_process(delta):
	var input_vector = get_input_vector()
	velocity = decelerate(delta) if input_vector == Vector2.ZERO else accelerate(delta, input_vector)
	velocity = move_and_slide(velocity)

	if Input.is_action_just_pressed("attack"):
		print("-5hp")
		get_node("CollisionShape2D").disabled= false

	if Input.is_action_just_pressed("attack"):
		print("-5hp")
		get_node("CollisionShape2D").disabled= true

func _process(delta):
	if attack_wait_for_next_sec > 0:
		attack_wait_for_next_sec -= delta
	if Input.is_action_just_pressed("attack") and attack_wait_for_next_sec <= 0:
		#print("-5hp")
		attack_active = true
		attack_active_timeleft_sec = ATTACK_TIME_SEC
		attack_wait_for_next_sec = ATTACK_INTERVAL + ATTACK_TIME_SEC
	elif attack_active:
		if attack_active_timeleft_sec > 0:
			attack_active_timeleft_sec -= delta
		if attack_active_timeleft_sec <= 0:
			attack_active = false
		try_attack()

