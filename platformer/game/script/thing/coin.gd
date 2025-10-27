extends Node2D

@onready var player = get_node('/root/Field/Level/Player')

func _process(delta):
    if (position - player.position).length() < 60:
        player.coin += 1
        queue_free()
