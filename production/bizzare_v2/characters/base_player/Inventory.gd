extends Node
var array = []

func _ready():
	randomize()

func _physics_process(delta):
	print(array.front())

