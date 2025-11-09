extends Node2D

@export var speed = 320.0
@export var velocity = Vector2(0, 0)
@export var jump = -600.0
@export var gravity = 1200.0
@export var terminal_speed = 800.0

var coin = 0
var stepping = null
var rect = Rect2(position, Vector2(80, 80))

func _ready():
    print(rect)
    
func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            move_player(delta)
            rect.position.x = position.x
            rect.position.y = position.y
    
func move_player(delta):
    velocity.x = 0
    
    if Input.is_action_pressed('left'):
        velocity.x -= speed
    if Input.is_action_pressed('right'):
        velocity.x += speed
    if Input.is_action_just_pressed('up'):
        stepping = null
        velocity.y = jump
    
    if velocity.y < terminal_speed:
        velocity.y += gravity * delta
        
    if stepping != null:
        stepping.handle_step(self, delta)
        stepping.detect_stepping(self)
    
    position.x += velocity.x * delta
    position.y += velocity.y * delta
