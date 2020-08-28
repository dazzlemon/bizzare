extends Collectable
var amount = 0


func _on_Area2D_area_entered(area):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	push_currency(rng.randi_range(5, 30) ,area)
	queue_free()


func push_currency(value , area):
	amount += value
	area.get_node("../Camera2D/currency_hud/label").text = str(amount)
