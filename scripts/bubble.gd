class_name Bubble extends Node

var scene = preload("res://scenes/animated_bubble.tscn")
var anim: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim = scene.instantiate()
	anim.scale *= 0.5
	assert(anim != null)
	add_child(anim)
	anim.offset.y = -230
	anim.play()
	
func set_position(pos: Vector2):
	anim.position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
