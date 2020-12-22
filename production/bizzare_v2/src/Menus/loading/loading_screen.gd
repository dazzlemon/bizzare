extends Control

const SIMULATED_DELAY_SEC = 0.1

var thread = null

onready var progress = $TextureRect/Progress

func _thread_load(path):
	var rli = ResourceLoader.load_interactive(path)
	assert(rli)
	var total = rli.get_stage_count()
	progress.call_deferred("set_max", total)
	var res = null

	var err = OK
	while err == OK:
		progress.call_deferred("set_value", rli.get_stage())
		OS.delay_msec(int(SIMULATED_DELAY_SEC * 1000.0))
		err = rli.poll()
	if err != OK:
		if err == ERR_FILE_EOF:
			res = rli.get_resource()
		else:
			print("There was an error loading")
	call_deferred("_thread_done", res)


func _thread_done(resource):
	assert(resource)
	thread.wait_to_finish()
	progress.hide()
	var new_scene = resource.instance()
	get_tree().current_scene.free()
	get_tree().current_scene = null
	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene
	visible = false


func load_scene(path):
	thread = Thread.new()
	thread.start( self, "_thread_load", path)
	raise() 
	progress.visible = true
