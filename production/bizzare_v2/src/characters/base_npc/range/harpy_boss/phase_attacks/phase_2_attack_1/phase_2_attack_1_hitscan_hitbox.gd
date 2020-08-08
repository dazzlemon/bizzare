class_name Phase2Attack1HitscanHitbox
extends BaseHitscanEnemyHitbox

func _ready():
	randomize()
	get_node("CollisionShape2D").position = Vector2(0 , rand_range(50,200))
