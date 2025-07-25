extends Camera3D

@onready var node_kart = get_node('../Kart')

func _process(delta):
    position.x = node_kart.position.x
    position.y = node_kart.position.y + 1.0
    position.z = node_kart.position.z - 2.0
