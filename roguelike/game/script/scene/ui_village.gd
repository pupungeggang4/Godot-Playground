extends CanvasLayer

@onready var text_control = get_node('TextControl')

func _process(delta):
    text_control.text = GVar.locale['control']
