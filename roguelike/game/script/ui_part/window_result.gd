extends Control

func _process(delta):
    if GVar.state == 'result':
        show()
    else:
        hide()
