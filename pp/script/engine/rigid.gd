extends StaticBody2D

@onready var c = get_node('CollisionShape2D')
@onready var polygon = get_node('Polygon2D')
var rect = Rect2(400, 640, 320, 80)

func _ready():
    position = Vector2(rect.position.x, rect.position.y)
    c.shape.set_size(Vector2(rect.size.x, rect.size.y))
    var v = PackedVector2Array()
    v.append(Vector2(-rect.size.x / 2, -rect.size.y / 2))
    v.append(Vector2(-rect.size.x / 2, +rect.size.y / 2))
    v.append(Vector2(+rect.size.x / 2, +rect.size.y / 2))
    v.append(Vector2(+rect.size.x / 2, -rect.size.y / 2))
    polygon.polygon = v
