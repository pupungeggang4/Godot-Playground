extends Control

@onready var node_battle = get_node('/root/Battle')

func _process(delta):
    if node_battle.menu == false:
        hide()
    else:
        show()
