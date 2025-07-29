extends Node3D

@export var speed = 0.0
@export var speed_max = 30.0
@export var acceler = 8.0
@export var frict = 5.0
@export var foward = Vector3(0.0, 0.0, 1.0)
@export var foward_world = Vector3(0.0, 0.0, 1.0)
@export var rotate_angle = 0.0
@export var handle = 1.0

func _process(delta: float) -> void:
	if Input.is_action_pressed('foward') and speed < speed_max:
		speed += acceler * delta
	else:
		if speed > 0:
			speed -= frict * delta
		else:
			speed = 0
			
	if speed > 0:
		if Input.is_action_pressed('left'):
			rotate_angle += delta * handle
		elif Input.is_action_pressed('right'):
			rotate_angle -= delta * handle
	
	position += foward_world.rotated(Vector3.UP, rotate_angle) * speed * delta
	rotation.y = rotate_angle
	
	if speed > 0:
		get_node('Wheel1').rotation.x += speed * 0.5 * delta
		get_node('Wheel2').rotation.x += speed * 0.5 * delta
