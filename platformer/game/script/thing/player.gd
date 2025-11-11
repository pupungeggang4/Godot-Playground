extends Entity

@export var speed = 320.0
@export var jump = -600.0
@export var gravity = 1200.0
@export var terminal_speed = 800.0

var coin = 0

func _ready():
    solid = false
    fixed = false
    rect.size = Vector2(80, 80)
    rect.position = position
    
func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            move_player(delta)
            rect.position = position
    
func move_player(delta):
    ground = false
    velocity.x = 0
    
    if Input.is_action_pressed('left'):
        velocity.x -= speed
    if Input.is_action_pressed('right'):
        velocity.x += speed
    position.x += velocity.x * delta
    rect.position = position
    
    handle_collide_x()
    
    if velocity.y < terminal_speed:
        velocity.y += gravity * delta
    position.y += velocity.y * delta
    rect.position = position
    
    handle_fall(delta)
    handle_collide_top()
    
    if Input.is_action_pressed('up'):
        ground = false
        velocity.y = jump
