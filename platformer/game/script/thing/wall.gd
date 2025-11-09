extends Node2D

class_name Wall

@export var rect = Rect2(200, 80, 160, 80)
@onready var player = get_tree().current_scene.get_node('Level/Player')

func _ready():
    position = Vector2(rect.position.x, rect.position.y)
    get_node('Sprite').region_rect = Rect2(0, 0, rect.size.x, rect.size.y)
    
func _process(delta):
    support_player()
        
func support_player():
    var fall_top = Physics.detect_fall_on_top(self.rect, player.rect)
    if fall_top > 0:
        player.position.y -= fall_top
        player.velocity.y = 0
        player.stepping = self
        
func handle_step(entity, delta):
    pass
    
func detect_stepping(entity):
    var fall_top = Physics.detect_fall_on_top(self.rect, entity.rect)
    if fall_top <= 0:
        entity.stepping = null
