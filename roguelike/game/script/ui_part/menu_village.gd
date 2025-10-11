extends Control

@onready var node_village = get_node('/root/Village')

func _process(delta):
    if node_village.menu == false:
        hide()
    else:
        show()
