extends TextureRect

var pos_arrow = [[280, 120], [600, 120], [920, 120]]

func _process(delta):
    if GVar.state == 'start':
        position.x = pos_arrow[GVar.selected_adventure_start][0]
        position.y = pos_arrow[GVar.selected_adventure_start][1]
    if GVar.state == 'reward':
        pass
