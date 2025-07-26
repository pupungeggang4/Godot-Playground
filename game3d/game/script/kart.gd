extends Node3D

@export var speed = 0.0
@export var speed_max = 2.5
@export var acceler = 3.0
@export var frict = 5.0
@export var foward = Vector3(0.0, 0.0, 1.0)
@export var foward_world = Vector3(0.0, 0.0, 1.0)
@export var rotate_angle = 0.0
@export var handle = 1.0

func _process(delta: float) -> void:
    if Input.is_action_pressed('foward'):
        if Input.is_action_pressed('left'):
            rotate_angle += delta * handle
        elif Input.is_action_pressed('right'):
            rotate_angle -= delta * handle

        speed += acceler * delta
    else:
        if speed > 0:
            speed -= frict * delta
        else:
            speed = 0
    
    position += foward_world.rotated(Vector3.UP, rotate_angle) * speed * delta
    rotation.y = rotate_angle
