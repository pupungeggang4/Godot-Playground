extends Node2D

@export var speed = 320.0
@export var velocity = Vector2(0, 0)
@export var gravity = 800.0
@export var terminal_speed = 800.0

var coin = 0

func _ready():
    pass
    
func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            move_player(delta)
    
func move_player(delta):
    var temp_position = Vector2(position.x, position.y)
    velocity.x = 0
    
    if Input.is_action_pressed('left'):
        velocity.x -= speed
    if Input.is_action_pressed('right'):
        velocity.x += speed
    
    if velocity.y < terminal_speed:
        velocity.y += gravity * delta
    
    temp_position.x += velocity.x * delta
    #temp_position.y += velocity.y * delta
    
    position.x = temp_position.x
    position.y = temp_position.y
