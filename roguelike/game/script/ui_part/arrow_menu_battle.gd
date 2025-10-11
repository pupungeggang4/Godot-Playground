extends Sprite2D

@onready var node_battle = get_node('/root/Battle')

func _process(delta):
    position.y = 280 + node_battle.selected_menu * 80
