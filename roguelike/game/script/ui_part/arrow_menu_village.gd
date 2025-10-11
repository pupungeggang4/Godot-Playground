extends Sprite2D

@onready var node_village = get_node('/root/Village')

func _process(delta):
    position.y = 320 + node_village.selected_menu * 80
