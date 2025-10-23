extends Node2D

var speed = 320.0

func _ready():
    pass
    
func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            move_player(delta)
    
func move_player(delta):
    var x_pressed = false
    var y_pressed = false
    var velocity = Vector2(0, 0)
    
    if Input.is_action_pressed('left'):
        x_pressed = true
        velocity.x -= 1
    if Input.is_action_pressed('right'):
        x_pressed = true
        velocity.x += 1
    if Input.is_action_pressed('up'):
        y_pressed = true
        velocity.y -= 1
    if Input.is_action_pressed('down'):
        y_pressed = true
        velocity.y += 1
    if x_pressed == true and y_pressed == true:
        velocity *= 0.7
    position.x += velocity.x * speed * delta
    position.y += velocity.y * speed * delta
