class_name Utility
extends Node


static func get_typeof(object):
	if object is Knight:
		return "Knight"
	elif object is Archer:
		return "Archer"
	elif object is Mage:
		return "Mage"
	else:
		return "undefined"


static func pick_random(list: Array):
	randomize()
	list.shuffle()
	return list.pop_front()


static func map(x, in_min, in_max, out_min, out_max):
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
