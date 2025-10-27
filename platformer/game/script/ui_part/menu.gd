extends Control

func _process(delta):
    if GVar.menu == true:
        show()
    else:
        hide()
