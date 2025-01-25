class_name Bubble extends Node

var scene = preload("res://scenes/animated_bubble.tscn")
var anim: AnimatedSprite2D

var spawnSound = preload("res://assets/bubble/BubbleSpawn.wav")
var popSounds = [preload("res://assets/bubble/Pop1.mp3"),
				preload("res://assets/bubble/Pop2.mp3"),
				preload("res://assets/bubble/Pop3.mp3"),
				preload("res://assets/bubble/Pop4.mp3")]

var velocity: Vector2
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim = scene.instantiate()
	anim.scale *= 0.5
	assert(anim != null)
	add_child(anim)
	anim.offset.y = -230
	velocity = Vector2(randf_range(-30, 30), randf_range(-150, 0))
	anim.play()
	player = AudioStreamPlayer.new()
	player.volume_db = linear_to_db($"/root/Settings".get_effect_volume())
	get_parent().add_child(player)
	var rand_pitch_scale = randf_range(0.5, 1.5)
	player.pitch_scale = rand_pitch_scale
	player.stream = spawnSound
	player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	anim.position = anim.position + velocity * delta

func set_position(pos: Vector2):
	anim.position = pos
	
func play_pop_sound():
	var rand_pitch_scale = randf_range(0.5, 1.5)
	player.pitch_scale = rand_pitch_scale
	player.stream = popSounds.pick_random()
	player.play()

func _notification(what: int):
	if what == NOTIFICATION_PREDELETE:  # Called when node is being deleted/freed
		var bubbles = get_parent()
		if (bubbles == null):
			return
		var gameScreen = bubbles.get_parent()
		if (gameScreen == null):
			return
		gameScreen.on_bubble_pop.emit(anim.position)
		play_pop_sound()
