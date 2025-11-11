extends Wall

@export var slide = 120

func _ready():
    solid = true
    fixed = true
    position = rect.position
    get_node('Sprite').region_rect = Rect2(0, 0, rect.size.x, rect.size.y)

func handle_step(entity, delta):
    entity.position.x += slide * delta
