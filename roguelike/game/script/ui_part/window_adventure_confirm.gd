extends Control

@onready var text_start = get_node('TextStart')
@onready var text_yes = get_node('TextYes')
@onready var text_no = get_node('TextNo')
@onready var arrow = get_node('Arrow')

func _process(delta):
    if GVar.state == 'adventure_confirm':
        show()
        text_start.text = GVar.locale['adventure_confirm']
        text_yes.text = GVar.locale['yes']
        text_no.text = GVar.locale['no']
        arrow.position.x = 360 + 320 * GVar.selected_adventure_confirm
    else:
        hide()
