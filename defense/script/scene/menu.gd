extends Control

@onready var text_paused = get_node('TextPaused')
@onready var text_resume = get_node('TextResume')
@onready var text_to_title = get_node('TextToTitle')
@onready var text_quit = get_node('TextQuit')

func _process(delta):
    if GVar.menu == false:
        hide()
    else:
        show()
        text_paused.text = GVar.locale['paused']
        text_resume.text = GVar.locale['resume']
        text_to_title.text = GVar.locale['to_title']
        text_quit.text = GVar.locale['quit']
