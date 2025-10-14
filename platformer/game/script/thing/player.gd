extends Node2D

@export var speed = 320.0
@export var velocity = Vector2(0, 0)

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
        velocity.x -= speed * delta
    if Input.is_action_pressed('right'):
        velocity.x += speed * delta
        
    temp_position.x += velocity.x
    temp_position.y += velocity.y
    
    position.x = temp_position.x
    position.y = temp_position.y
