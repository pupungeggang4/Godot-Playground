extends Node2D

@onready var player = get_node('/root/Main/Player')
@onready var main = get_node('/root/Main')
@export var velocity = Vector2.ZERO

func _process(delta):
    if main.state == '':
        position += velocity * delta
        if position.x > 1360 or position.x < -80 or position.y > 800 or position.y < -80:
            queue_free()
        if (position - player.position).length() < 280 and player.light == true:
            hide()
        else:
            show()
