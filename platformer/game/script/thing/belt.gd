extends Wall

@export var slide = 120

func _ready():
    rect = Rect2(0, 80, 160, 80)
    position = Vector2(rect.position.x, rect.position.y)
    get_node('Sprite').region_rect = Rect2(0, 0, rect.size.x, rect.size.y)

func handle_step(entity, delta):
    entity.position.x += slide * delta
