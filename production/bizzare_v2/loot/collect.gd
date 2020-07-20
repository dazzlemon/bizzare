extends Area2D
export var item_name = "item"
var count = 1
var age = 0

func _on_Area2D_body_entered(_body):
  push_item([item_name, count, age])
  queue_free()

func push_item(item):
	var getArr = get_node("../../knight/Inventory").array
	var condition = false
	for i in range(getArr.size()):
		if getArr[i][0] == item[0] :#0 = item_name
			getArr[i][1] += 1 #1 = count
			condition = true
		if condition == true:
			break
	if condition == false:
		getArr.push_front(item)
		item[2] = getArr.size()#2 = age
