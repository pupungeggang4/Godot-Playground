extends Node2D

@onready var unit = get_tree().current_scene.get_node('Unit')

var velocity = Vector2(1.0, 0.0)
var speed = 200.0
var damage = 5

func _ready() -> void:
    pass

func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            move(delta)
            for u in unit.get_children():
                if (u.position - position).length() < 40:
                    u.hp -= damage
                    queue_free()
            if position.x >= 1200 or position.x <= 80:
                queue_free()

func move(delta):
    position.x += velocity.x * speed * delta
