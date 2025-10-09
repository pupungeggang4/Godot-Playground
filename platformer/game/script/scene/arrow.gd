extends TextureRect

@onready var node_title = get_node('/root/Title')

func _process(delta):
    position.y = 160 + node_title.selected * 80
