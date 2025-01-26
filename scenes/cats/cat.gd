class_name Cat extends RigidBody2D

@export var ACCELERATION = 100
@export var MAX_SPEED = 200
@export var FRICTION = 200
@export var BUBBLE_HIT_DISTANCE = 200

var food:Node2D
@onready var sprite = $AnimatedSprite2D 
var velocity = Vector2.ZERO
@onready var foodDetectionZone = $FoodDetectionZone
@onready var foodDetectionZone2 = $FoodDetectionZone2
var is_targetable = true
var bubble_hit = [preload("res://assets/cats/mreor.mp3"),
				 preload("res://assets/cats/Angrymeow.mp3")]
				
var player

var despawnTimer: Timer

enum {
	IDLE,
	WANDER,
	CHASE,
	ESCAPE
}

var state = CHASE
var lifeCount: int = 9

func seek_Food():
	if foodDetectionZone2.can_see_food():
		state = IDLE
		get_parent().get_parent().on_cat_reaches_food.emit()
	elif foodDetectionZone.can_see_food():
		state = CHASE
		food = foodDetectionZone.food
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().get_parent().on_bubble_pop.connect(_on_bubble_pop)
	food = get_node("/root/GameScreen/Hamburger")
	sprite.play("run")
	
	player = AudioStreamPlayer.new()
	player.volume_db = linear_to_db($"/root/Settings".get_effect_volume()) + 9
	add_child(player)
	
	lifeCount = $"/root/Settings".get_cat_lifes()

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
				velocity = velocity.move_toward(direction * MAX_SPEED * 1.5, ACCELERATION * 1.5 * delta)
				
				if direction.x > 0:
					sprite.flip_h = true # Moving right
				elif direction.x < 0:
					sprite.flip_h = false # Moving left
		ESCAPE:
			if food:
				var direction = -(food.position - position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
				
				if direction.x > 0:
					sprite.flip_h = true # Moving right
				elif direction.x < 0:
					sprite.flip_h = false # Moving left
			else:
				var direction = Vector2(0.2, -1).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
				
				if direction.x > 0:
					sprite.flip_h = true # Moving right
				elif direction.x < 0:
					sprite.flip_h = false # Moving left
	linear_velocity = velocity


func _on_bubble_pop(position: Vector2):
	if is_targetable:
		if position.distance_to(self.position) < BUBBLE_HIT_DISTANCE:
			if food:
				is_targetable = false
				$Timer.start()
				lifeCount -= 1
				sprite.play("scared")
				print("cat now has ", lifeCount, " left")
				var direction = (food.position - position).normalized()
				velocity = velocity.move_toward(-direction * MAX_SPEED, 5000)

				var rand_pitch_scale = randf_range(0.5, 1.5)
				player.pitch_scale = rand_pitch_scale
				player.stream = bubble_hit.pick_random()
				player.play()

		if lifeCount <= 0:
			state = ESCAPE
			despawnTimer = CleanupTimer.new_timer(self)
			despawnTimer.setup()
			despawnTimer.start()


func _on_timer_timeout() -> void:
	is_targetable = true
	sprite.play("run")
