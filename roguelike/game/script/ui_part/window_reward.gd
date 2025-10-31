extends Control

@onready var text_title = get_node('TextTitle')

func _process(delta):
    if GVar.state == 'start' or GVar.state == 'reward':
        show()
        if GVar.state == 'start':
            text_title.text = GVar.locale['select_weapon']
    else:
        hide()
