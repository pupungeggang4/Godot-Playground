extends Node2D

func _process(delta):
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        print(mouse)
