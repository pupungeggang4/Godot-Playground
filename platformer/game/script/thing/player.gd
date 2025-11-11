extends Node2D

@onready var entities = get_tree().current_scene.get_node('Level/Entity')

@export var speed = 320.0
@export var velocity = Vector2(0, 0)
@export var jump = -600.0
@export var gravity = 1200.0
@export var terminal_speed = 800.0

var coin = 0
var ground = false
var rect = Rect2(position, Vector2(80, 80))

func _ready():
    print(rect)
    
func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            move_player(delta)
    
func move_player(delta):
    ground = false
    velocity.x = 0
    
    if Input.is_action_pressed('left'):
        velocity.x -= speed
    if Input.is_action_pressed('right'):
        velocity.x += speed
    position.x += velocity.x * delta
    rect.position.x = position.x
    rect.position.y = position.y
    
    for entity in entities.get_children():
        if entity.solid == true:
            var left = Physics.collide_from_left(entity.rect, rect)
            if left > 0:
                position.y -= left
                velocity.y = 0
                break
            var right = Physics.collide_from_right(entity.rect, rect)
            if right > 0:
                position.y -= right
                velocity.y = 0
                break
    
    if velocity.y < terminal_speed:
        velocity.y += gravity * delta
    position.y += velocity.y * delta
    rect.position.x = position.x
    rect.position.y = position.y
    
    if velocity.y > 0:
        for entity in entities.get_children():
            if entity.solid == true:
                var fall_top = Physics.detect_fall_on_top(entity.rect, rect)
                if fall_top > 0:
                    position.y -= fall_top
                    velocity.y = 0
                    ground = true
                    entity.handle_step(self, delta)
                    break
                    
    for entity in entities.get_children():
        if entity.solid == true:
            var bottom = Physics.detect_from_bottom(entity.rect, rect)
            if bottom > 0:
                position.y += bottom
                velocity.y = 0
                break
    
    if Input.is_action_pressed('up'):
        ground = false
        velocity.y = jump
