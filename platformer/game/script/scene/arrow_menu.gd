extends TextureRect

@onready var node_field = get_node('/root/Field')

func _process(delta):
    position.y = 280 + node_field.selected_menu * 80
