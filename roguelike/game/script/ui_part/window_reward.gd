extends Control

func _process(delta):
    if GVar.state == 'start' or GVar.state == 'reward':
        show()
    else:
        hide()
