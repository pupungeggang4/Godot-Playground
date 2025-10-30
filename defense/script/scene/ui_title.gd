extends CanvasLayer

@onready var text_title = get_node('TextTitle')
@onready var text_start = get_node('TextStart')
@onready var text_lang = get_node('TextLang')
@onready var text_collection = get_node('TextCollection')
@onready var text_quit = get_node('TextQuit')

func _process(delta):
    text_title.text = GVar.locale['game_name']
    text_start.text = GVar.locale['start_game']
    text_lang.text = GVar.locale['lang']
    text_collection.text = GVar.locale['collection']
    text_quit.text = GVar.locale['quit']
