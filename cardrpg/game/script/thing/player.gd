extends Node2D

@export var speed = 320.0

func _process(delta):
    move_player(delta)
    
func move_player(delta):
    if Input.is_action_pressed('left'):
        position.x -= speed * delta
    if Input.is_action_pressed('right'):
        position.x += speed * delta
    if Input.is_action_pressed('up'):
        position.y -= speed * delta
    if Input.is_action_pressed('down'):
        position.y += speed * delta
