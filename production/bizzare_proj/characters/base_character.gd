extends KinematicBody2D

onready var stats = $stats

var loot_scene = preload("res://players/npc/Coin.tscn")

export var ACCEL = 2000#make these modifiable for inherited scenes
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
	var input_vector = get_node("control").get_input_vector()
	velocity = decelerate(delta) if input_vector == Vector2.ZERO else accelerate(delta, input_vector)
	velocity = move_and_slide(velocity)

#func _process(delta):
	#pass
	
func _on_hurtbox_area_entered(area):
	stats.health -= area.damage
	print("hp:" , stats.health)

func _on_stats_no_health():
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
