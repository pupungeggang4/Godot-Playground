extends Control

@onready var text_paused = get_node('TextPaused')
@onready var text_resume = get_node('TextResume')
@onready var text_exit = get_node('TextExit')
@onready var text_quit = get_node('TextQuit')
@onready var arrow = get_node('Arrow')

func _process(delta):
    if GVar.menu == false:
        hide()
    else:
        show()
        text_paused.text = GVar.locale['paused']
        text_resume.text = GVar.locale['resume']
        text_exit.text = GVar.locale['title']
        text_quit.text = GVar.locale['quit']
        arrow.position.y = 280 + GVar.selected_menu_village * 80
