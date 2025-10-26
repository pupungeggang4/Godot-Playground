extends Node2D

@export var size = Vector2(160, 80)
@onready var player = get_node('/root/Field/Level/Player')

func _ready():
    position = Vector2(0, 80)
    get_node('Sprite').region_rect = Rect2(0, 0, size.x, size.y)
    
func _process(delta):
    support_player()
        
func support_player():
    pass
