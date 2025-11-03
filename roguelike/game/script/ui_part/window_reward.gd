extends Control

@onready var text_title = get_node('TextTitle')
@onready var text_ok = get_node('TextOK')

func _process(delta):
    if GVar.state == 'start' or GVar.state == 'reward':
        show()
        if GVar.state == 'start':
            text_title.text = GVar.locale['select_weapon']
            text_ok.text = GVar.locale['ok']
    else:
        hide()
