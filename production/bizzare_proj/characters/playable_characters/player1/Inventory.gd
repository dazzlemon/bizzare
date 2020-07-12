extends Node
var array = []

func _ready():
	randomize()
	array.push_front(11)

func _physics_process(delta):
	print(array.front())


