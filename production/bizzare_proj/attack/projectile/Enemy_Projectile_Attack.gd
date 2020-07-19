extends "res://attack/projectile/Projectile_Attack.gd"

func _ready():
	projectile = preload("res://attack/projectile/Enemy_Projectile.tscn")
	ATTACK_INTERVAL = 0.15

