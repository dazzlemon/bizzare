class_name PhaseAttacks
extends SpellCdDurationWave

func _get_cd():
	return _INTERVAL + _DURATION
