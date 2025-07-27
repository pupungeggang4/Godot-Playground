extends Label

@onready var node_kart = get_node('../../Kart')

func _process(delta):
    text = str(snapped(node_kart.speed, 0.1) * 2) + 'kmh'
