#extends Node2D
extends KinematicBody2D

const ACCEL = 2000
const MAX_SPEED = 300
const DECEL = 2000

var velocity

var texture = preload("res://textures/Chilopups.png")

func set_sprite():
	get_node("Sprite").set_texture(texture)

func set_hitbox():
	var new_hitbox = CircleShape2D.new()
	new_hitbox.set_radius(20)
	get_node("hitbox").set_shape(new_hitbox)
	# example code
	
func set_hurtbox():
	var new_hurtbox = CircleShape2D.new()
	new_hurtbox.set_radius(10)
	
	#set offset
	get_node("MeleeAttack/swordhitbox").translate(Vector2(20, 0))
	
	get_node("MeleeAttack/swordhitbox/CollisionShape2D").set_shape(new_hurtbox)
	# example code

func _ready():
	set_hitbox()
	set_hurtbox()
	set_sprite()
	velocity = Vector2.ZERO	

func accelerate(delta, input_vector):
	return velocity.move_toward(input_vector * MAX_SPEED, ACCEL * delta)
	
func decelerate(delta):
	return velocity.move_toward(Vector2.ZERO, DECEL * delta)
	
func _physics_process(delta):
	var input_vector = get_node("Control").get_input_vector()
	velocity = decelerate(delta) if input_vector == Vector2.ZERO else accelerate(delta, input_vector)
	velocity = move_and_slide(velocity)
