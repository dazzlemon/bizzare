class_name HealthBar
extends StatusBar

#export(Color) var default_color = Color ("#dc4250")

func _ready():
	max_value_str = "max_health"
	value_str = "health"
	._ready()

#func pulse():
#	pulse_tween.interpolate_property(status_bar, "tint_progress" , pulse_color , default_color, 1.2, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
#	pulse_tween.interpolate_callback(self, 0.0, "emit_signal" , "pulse" )
#	pulse_tween.start()
