extends Area2D

func _on_Area2D_body_entered(_body):
	get_node("../../player1/Inventory").array.push_front(12)
	queue_free()
