extends Node

signal on_bubble_pop(position: Vector2)
signal on_cat_despawn(cat: Cat)
signal on_cat_reaches_food()

var catManager: CatManager
var cat_scene: PackedScene = preload("res://scenes/cats/cat.tscn")
var countdown_timer = 45

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	catManager = CatManager.new()
	add_child(catManager)
	add_cats_to_manager()
	on_cat_reaches_food.connect(_on_cat_reaches_food)
	on_cat_despawn.connect(_on_cat_despawn)
	$Label.text = str(countdown_timer)
	$Timer.start()

func _on_cat_reaches_food():
	get_tree().change_scene_to_file("res://scenes/loose_screen.tscn")

func add_cats_to_manager():
	var res = []
	for node in get_children():
		if node.name.begins_with("GeneratedCats"):
			for node2 in node.get_children():
				if node2.name.begins_with("Cat"):
					res.push_back(node2)
	for cat in res:
		catManager.add_cat(cat)
		
	
func _on_cat_despawn(cat: Cat):
	catManager.remove_cat(cat)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cat_spawn_timer_timeout() -> void:
	var cat_markers = $StartPoints.get_children()
	var selected_cat = cat_markers[randi() % cat_markers.size()]
	
	var new_cat = cat_scene.instantiate() as RigidBody2D
	new_cat.position = selected_cat.global_position
	$GeneratedCats.add_child(new_cat)
	catManager.add_cat(new_cat)


func _on_win_timer_timeout() -> void:
	countdown_timer -= 1
	$Label.text = str(countdown_timer)
	
	if countdown_timer <= 0:
		get_tree().change_scene_to_file("res://scenes/win_screen.tscn")
		$Timer.stop()
