extends PointLight2D

@onready var player = get_node('/root/Main/Player')

func _process(delta):
    position = player.position
