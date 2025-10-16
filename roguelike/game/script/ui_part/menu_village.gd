extends Control

func _process(delta):
    if GVar.menu == false:
        hide()
    else:
        show()
