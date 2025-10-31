extends Control

@onready var text_paused = get_node('TextPaused')
@onready var text_resume = get_node('TextResume')
@onready var text_surrender = get_node('TextSurrender')
@onready var text_to_title = get_node('TextToTitle')
@onready var text_quit = get_node('TextQuit')
@onready var arrow = get_node('Arrow')

func _process(delta):
    if GVar.menu == false:
        hide()
    else:
        show()
        text_paused.text = GVar.locale['paused']
        text_resume.text = GVar.locale['resume']
        text_surrender.text = GVar.locale['surrender']
        text_to_title.text = GVar.locale['title']
        text_quit.text = GVar.locale['quit']
        arrow.position.y = 240 + 80 * GVar.selected_menu_battle
