class_name CatManager extends Node

var cats = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_cat(cat: Cat):
	cats.append(cat)
	
func remove_cat(cat: Cat):
	cats.erase(cat)
	cat.queue_free()
	# TODO: make cat run away instead of just deleting it
	#if cats.is_empty():
		#get_tree().change_scene_to_file("res://scenes/win_screen.tscn")
