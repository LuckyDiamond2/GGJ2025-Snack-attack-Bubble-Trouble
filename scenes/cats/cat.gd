extends RigidBody2D


var speed = 200
var food:Node2D
@onready var sprite = $AnimatedSprite2D 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	food = get_node("/root/Node/Hamburger")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if food and position.distance_to(food.position) > 10:
		var direction = (food.position - position).normalized()
		linear_velocity = direction * speed
		
		if direction.x > 0:
			sprite.flip_h = true  # Moving right
		elif direction.x < 0:
			sprite.flip_h = false   # Moving left
	else:
		linear_velocity = Vector2.ZERO
		
