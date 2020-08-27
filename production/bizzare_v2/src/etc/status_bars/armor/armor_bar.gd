class_name ArmorBar
extends StatusBar


func _ready():
	status_bar.max_value = stats.max_armor
	status_bar.value = stats.max_armor
	animation.max_value = stats.max_armor


func update_max_value():
	status_bar.value = status_bar.value / stats.max_armor * status_bar.max_value #NEED PT
	animation.value = animation.value / stats.max_armor * animation.max_value # NEED PT
	status_bar.max_value = stats.max_armor
	animation.max_value = stats.max_armor


func update_value():
	if status_bar.value != stats.max_armor:
		status_bar.value = stats.max_armor
		update_tween.interpolate_property(animation, "value", animation.value, stats.max_armor, 0.175, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.175)
		update_tween.start()
	
