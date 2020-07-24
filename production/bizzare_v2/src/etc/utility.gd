extends Node

static func get_typeof(object):
	if object is Knight:
		return "Knight"
	elif object is Archer:
		return("Archer")
	else :
		return "undefined"
