extends Node3D

@export var speed = 0.0
@export var speed_max = 5.0
@export var acceler = 2.0
@export var frict = 2.0

func _process(delta: float) -> void:
    if Input.is_action_pressed('foward'):
        speed += acceler * delta
    else:
        if speed > 0:
            speed -= frict * delta
        else:
            speed = 0
        
    position.z += speed * delta
