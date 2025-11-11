extends Node2D

class_name Entity
@onready var entities = get_tree().current_scene.get_node('Level/Entity')
@export var solid = false
@export var fixed = false
@export var ground = false
@export var rect = Rect2(0, 0, 0, 0)
@export var velocity = Vector2(0, 0)

func _ready():
    pass
    
func _process(delta):
    pass

func handle_collide_x():
    for entity in entities.get_children():
        if entity != self and entity.solid == true:
            var left = Physics.collide_from_left(entity.rect, rect)
            if left > 0:
                position.x -= left
                rect.position = position
                velocity.x = 0
                break
            var right = Physics.collide_from_right(entity.rect, rect)
            if right > 0:
                position.x += right
                rect.position = position
                velocity.x = 0
                break
                
func handle_fall(delta):
    if velocity.y > 0:
        for entity in entities.get_children():
            if entity != self and entity.solid == true:
                var fall_top = Physics.detect_fall_on_top(entity.rect, rect)
                if fall_top > 0:
                    position.y -= fall_top
                    rect.position = position
                    velocity.y = 0
                    ground = true
                    entity.handle_step(self, delta)
                    break

func handle_collide_top():
    for entity in entities.get_children():
        if entity != self and entity.solid == true:
            var bottom = Physics.detect_from_bottom(entity.rect, rect)
            if bottom > 0:
                position.y += bottom
                rect.position = position
                velocity.y = 0
                break
                    
func handle_step(entity, delta):
    pass
