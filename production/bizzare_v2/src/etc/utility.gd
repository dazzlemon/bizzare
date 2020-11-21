class_name Utility
extends Node


static func instance_of(name):#GOVNO KOSTIL
	var str_ = "res://src/characters/base_player/" + name.to_lower() + "/" + name.to_lower() + ".tscn"
	return load(str_).instance()


static func get_typeof(object):
	if object is Knight:
		return "Knight"
	if object is Archer:
		return "Archer"
	if object is Mage:
		return "Mage"
	return "undefined"


static func pick_random(list: Array):
	randomize()
	list.shuffle()
	return list.pop_front()


static func map(x, in_min, in_max, out_min, out_max):
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
