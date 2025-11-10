extends Node2D

class_name Wall

@export var rect = Rect2(200, 80, 160, 80)
@onready var player = get_tree().current_scene.get_node('Level/Player')

var solid = true

func _ready():
    position = Vector2(rect.position.x, rect.position.y)
    get_node('Sprite').region_rect = Rect2(0, 0, rect.size.x, rect.size.y)
    
func _process(delta):
    pass
        
func handle_step(entity, delta):
    pass
