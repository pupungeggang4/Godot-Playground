extends Node2D

func _ready():
    var node_button_list = get_node('UI/ButtonList')
    
    for i in range(3):
        for j in range(6):
            var node_level = ColorRect.new()
            node_level.position = Vector2(40 + 160 * j, 160 + 160 * i)
            node_level.size = Vector2(120, 120)
            node_button_list.add_child(node_level)
