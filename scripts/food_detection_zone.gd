extends Area2D

var food = null

func can_see_food():
	return food != null

func _on_body_entered(body: Node2D) -> void:
	food = body
