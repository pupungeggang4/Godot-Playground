extends Control

@onready var node_field = get_node('/root/Field')

func _process(delta):
    if node_field.menu == true:
        show()
    else:
        hide()
