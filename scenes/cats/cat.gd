extends RigidBody2D

@export var ACCELERATION = 100
@export var MAX_SPEED = 200
@export var FRICTION = 200
@export var BUBBLE_HIT_DISTANCE = 200

var food:Node2D
@onready var sprite = $AnimatedSprite2D 
var velocity = Vector2.ZERO
@onready var foodDetectionZone = $FoodDetectionZone
@onready var foodDetectionZone2 = $FoodDetectionZone2

enum {
	IDLE,
	WANDER,
	CHASE
}

var state = CHASE

func seek_Food():
	if foodDetectionZone2.can_see_food():
		state = IDLE
		get_parent().on_cat_reaches_food.emit()
	elif foodDetectionZone.can_see_food():
		state = CHASE
		food = foodDetectionZone.food
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().on_bubble_pop.connect(_on_bubble_pop)
	food = get_node("/root/GameScreen/Hamburger")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	match state:
		IDLE:
			velocity = Vector2.ZERO
		WANDER:
			pass
		CHASE:
			seek_Food()
			if food:
				var direction = (food.position - position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
				
				if direction.x > 0:
					sprite.flip_h = true # Moving right
				elif direction.x < 0:
					sprite.flip_h = false # Moving left
				
	linear_velocity = velocity
				
	
func _on_bubble_pop(position: Vector2):
	if position.distance_to(self.position) < BUBBLE_HIT_DISTANCE:
		if food:
			var direction = (food.position - position).normalized()
			velocity = velocity.move_toward(-direction * MAX_SPEED, 5000)
	#print("distance: ", position.distance_to(self.position))
	
	#if food and position.distance_to(food.position) > 10:
		#var direction = (food.position - position).normalized()
		#linear_velocity = direction * speed
		#
		#if direction.x > 0:
			#sprite.flip_h = true  # Moving right
		#elif direction.x < 0:
			#sprite.flip_h = false   # Moving left
	#else:
		#linear_velocity = Vector2.ZERO
		#
