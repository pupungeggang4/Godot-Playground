extends Node2D

var speed = 640.0
var direction = Vector2(1.0, 0.0)
var side = 0
var damage = 5
var life_time = 1.0

func _ready():
    pass
    
func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            move(delta)
            handle_life_time(delta)
            
func move(delta):
    position += direction * speed * delta
    
func handle_life_time(delta):
    if life_time <= 0:
        queue_free()
    else:
        life_time -= delta
