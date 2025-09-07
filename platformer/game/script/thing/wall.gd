extends Node2D

var rect = Rect2(Vector2(800, 400), Vector2(80, 80))

func _ready():
    position = rect.position
    get_node('Rect').size = rect.size
    
func _process(delta):
    pass
