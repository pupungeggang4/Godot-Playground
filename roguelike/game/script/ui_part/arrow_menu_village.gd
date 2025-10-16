extends Sprite2D

func _process(delta):
    position.y = 280 + GVar.selected_menu_village * 80
