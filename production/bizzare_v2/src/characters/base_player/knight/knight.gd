#
class_name Knight
extends BasePlayer


func take_damage(damage: float) -> void:
	attack_player.play("damage")
	.take_damage(damage)
