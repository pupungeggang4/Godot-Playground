extends Node

func _ready():
    pass
    
func _process(delta):
    if Input.is_action_just_pressed('select'):
        Func.change_scene(self, 'res://scene/game.tscn', 'Game')
