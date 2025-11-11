extends Entity

@export var gravity = 1200.0
@export var terminal_speed = 800.0

func _ready():
    solid = false
    fixed = false
    position = rect.position

func _process(delta):
    handle_collide_x()
    
    if velocity.y < terminal_speed:
        velocity.y += gravity * delta
    position.y += velocity.y * delta
    rect.position = position
    
    handle_fall(delta)
    handle_collide_top()
