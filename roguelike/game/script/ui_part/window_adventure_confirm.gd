extends Control

func _process(delta):
    if GVar.state == 'adventure_confirm':
        show()
    else:
        hide()
