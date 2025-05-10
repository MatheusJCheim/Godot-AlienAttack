extends CharacterBody2D
var speed = 300
var screen_size : Vector2
var rocket_scene = preload("res://scenes/rocket.tscn")
@onready var rocket_container = $RocketContainer

func _ready():
	get_viewport().connect("size_changed", Callable(self, "_on_viewport_size_changed"))
	update_viewport_size()
	
func _on_viewport_size_changed():
	update_viewport_size()

func update_viewport_size():
	screen_size = get_viewport().get_visible_rect().size
	
func _physics_process(delta: float) -> void:
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	move_and_slide()
	
	global_position = global_position.clamp(Vector2(0,0), screen_size)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position + Vector2(75,0)
