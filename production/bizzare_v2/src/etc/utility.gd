class_name Utility
extends Node


static func get_typeof(object):
	if object is Knight:
		return "Knight"
	elif object is Archer:
		return "Archer"
	else:
		return "undefined"


static func pick_random(list: Array):
	randomize()
	list.shuffle()
	return list.pop_front()
