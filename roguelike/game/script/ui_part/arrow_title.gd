extends Sprite2D

func _ready():
    pass
    
func _process(delta):
    position.y = 160 + GVar.selected_title * 80
