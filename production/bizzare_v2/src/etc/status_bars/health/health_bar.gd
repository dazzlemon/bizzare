class_name HealthBar
extends StatusBar

func _ready():
	status_bar.max_value = stats.max_health
	status_bar.value = stats.max_health
	animation.max_value = stats.max_health

func _process(delta):
	update_max_value()
	update_value()


func update_max_value():
	status_bar.value = status_bar.value / stats.max_health * status_bar.max_value #NEED PT
	animation.value = animation.value / stats.max_health * animation.max_value # NEED PT
	status_bar.max_value = stats.max_health
	animation.max_value = stats.max_health


func update_value():
	if status_bar.value != stats.health:
		status_bar.value = stats.health
		update_tween.interpolate_property(animation, "value", animation.value, stats.health, 0.175, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.175)
		update_tween.start()
	
