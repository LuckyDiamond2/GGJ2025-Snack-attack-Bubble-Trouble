extends Node

signal on_bubble_pop(position: Vector2)
signal on_cat_despawn(cat: Cat)
signal on_cat_reaches_food()

var catManager: CatManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	catManager = CatManager.new()
	add_child(catManager)
	add_cats_to_manager()
	on_cat_reaches_food.connect(_on_cat_reaches_food)
	on_cat_despawn.connect(_on_cat_despawn)
	pass

func _on_cat_reaches_food():
	get_tree().change_scene_to_file("res://scenes/loose_screen.tscn")

func add_cats_to_manager():
	var res = []
	for node in get_children():
		if node.name.begins_with("Cat"):
			res.push_back(node)
	for cat in res:
		catManager.add_cat(cat)
		
	
func _on_cat_despawn(cat: Cat):
	catManager.remove_cat(cat)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
