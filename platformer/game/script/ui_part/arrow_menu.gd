extends TextureRect

func _process(delta):
    position.y = 280 + GVar.selected_menu * 80
