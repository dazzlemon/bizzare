#
class_name Knight
extends BasePlayer

onready var spell_1_hitbox = $spell_1/hitbox

func _ready():
	spell_1_hitbox.knockback_vector = Vector2.RIGHT
