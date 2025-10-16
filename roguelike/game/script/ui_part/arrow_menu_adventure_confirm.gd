extends TextureRect

func _process(delta):
    position.x = 360 + GVar.selected_adventure_confirm * 320
