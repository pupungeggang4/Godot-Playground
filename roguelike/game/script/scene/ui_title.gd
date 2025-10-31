extends CanvasLayer

@onready var text_title = get_node('TextTitle')
@onready var text_start = get_node('TextStart')
@onready var text_collection = get_node('TextCollection')
@onready var text_lang = get_node('TextLang')
@onready var text_erase = get_node('TextErase')
@onready var text_quit = get_node('TextQuit')
@onready var arrow = get_node('Arrow')

func _process(delta):
    text_title.text = GVar.locale['game_name']
    text_start.text = GVar.locale['start_game']
    text_collection.text = GVar.locale['collection']
    text_lang.text = GVar.locale['lang']
    text_erase.text = GVar.locale['erase_data']
    text_quit.text = GVar.locale['quit']
    arrow.position.y = 160 + GVar.selected_title * 80
