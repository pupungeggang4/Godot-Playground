extends Control

@onready var text_title = get_node('TextTitle')

func _process(delta):
    text_title.text = GVar.locale['collection']
