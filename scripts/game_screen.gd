extends Node

signal on_bubble_pop(position: Vector2)
signal on_cat_reaches_food()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	on_cat_reaches_food.connect(_on_cat_reaches_food)
	pass

func _on_cat_reaches_food():
	get_tree().change_scene_to_file("res://scenes/loose_screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
