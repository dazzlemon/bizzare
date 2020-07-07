extends KinematicBody2D

onready var stats = $Stats
var loot_scene = preload("res://players/npc/Coin.tscn")

const ACCEL = 2000
const MAX_SPEED = 300
const DECEL = 2000

var velocity

func _ready():
	set_hitbox()
	set_hurtbox()
	set_sprite()
	set_attack_hitbox()
	velocity = Vector2.ZERO	
	randomize()

func set_sprite():
	var texture = load("res://textures/Chilopups.png")
	get_node("Sprite").set_texture(texture)

func set_hitbox():
	var new_hitbox = CircleShape2D.new()
	new_hitbox.set_radius(20)
	get_node("hitbox").set_shape(new_hitbox)
	# example code
	
func set_hurtbox():
	var new_hurtbox = RectangleShape2D.new()
	new_hurtbox.set_extents(Vector2(20, 20))
	get_node("hurtbox/CollisionShape2D").set_shape(new_hurtbox)
	# example code
	
func set_attack_hitbox():
	var new_hurtbox = CircleShape2D.new()
	new_hurtbox.set_radius(10)
	
	#set offset
	get_node("MeleeAttack/swordhitbox").translate(Vector2(31, 0))
	
	get_node("MeleeAttack/swordhitbox/CollisionShape2D").set_shape(new_hurtbox)
	# example code

func accelerate(delta, input_vector):
	return velocity.move_toward(input_vector * MAX_SPEED, ACCEL * delta)
	
func decelerate(delta):
	return velocity.move_toward(Vector2.ZERO, DECEL * delta)
	
func _physics_process(delta):
	var input_vector = get_node("Control").get_input_vector()
	velocity = decelerate(delta) if input_vector == Vector2.ZERO else accelerate(delta, input_vector)
	velocity = move_and_slide(velocity)

func _on_hurtbox_area_entered(area):
	stats.health -= area.damage
	print("hp:" , stats.health)

func _on_Stats_no_health():
	queue_free()
	var random = randi() % 100 + 1
	print(random)
	if random <= 50:
		print("<=50")
		var loot = loot_scene.instance()
		loot.global_position=global_position
		get_tree().get_root().add_child(loot)
	else:
		print(">50")
