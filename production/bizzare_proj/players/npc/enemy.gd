extends  KinematicBody2D

var loot_scene = preload("res://players/npc/Coin.tscn")

export var ACCEL = 300
export var MAX_SPEED = 100
export var DECCEL = 200

enum{
	IDLE,
	WANDER,
	CHASE
}

var velocity= Vector2.ZERO

var state = CHASE

onready var stats = $Stats
onready var playerDetectionZone = $PlayerDetectionZone
func _ready():
	randomize()

func _physics_process(delta):
	match state:
		IDLE:
			velocity=velocity.move_toward(Vector2.ZERO, DECCEL * delta)
			seek_player()
		WANDER:
			pass
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity= velocity.move_toward(direction * MAX_SPEED, ACCEL * delta)
			else:
				state = IDLE
			#sprite.flip_h = velocity.x<0 (rotate spite in player direction)
	velocity = move_and_slide(velocity)

func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE

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

