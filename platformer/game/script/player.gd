extends Node2D

@export var speed = 200.0

func _ready():
    pass
    
func _process(delta):
    if Input.is_action_pressed('left'):
        position.x -= speed * delta
    elif Input.is_action_pressed('right'):
        position.x += speed * delta
