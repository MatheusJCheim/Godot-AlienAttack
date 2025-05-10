extends Area2D

@export var speed = 200
var test = 1
func _physics_process(delta: float) -> void:
	global_position.x -= speed * delta
	
func die():
	queue_free()
