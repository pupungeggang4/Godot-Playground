extends Node2D

@onready var collision_shape = get_node('Area2D/CollisionShape2D')

var side = 0
var velocity = Vector2(1.0, 0.0)
var speed = 200.0
var damage = 5

func _ready() -> void:
    pass

func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            move(delta)

func move(delta):
    position.x += velocity.x * speed * delta
    if position.x >= 1200 or position.x <= 80:
        queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
    var unit = area.get_parent()
    unit.hp -= damage
    queue_free()
    
