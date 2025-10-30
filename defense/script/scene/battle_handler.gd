extends Node

func _ready():
    pass
    
func _process(delta):
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_released('mouse'):
        var mouse = get_viewport().get_mouse_position()
