extends Entity
class_name Wall

@onready var player = get_tree().current_scene.get_node('Level/Player')

func _ready():
    solid = true
    fall = true
    position = rect.position
    get_node('Sprite').region_rect = Rect2(0, 0, rect.size.x, rect.size.y)
    
func _process(delta):
    pass
        
func handle_step(entity, delta):
    pass
