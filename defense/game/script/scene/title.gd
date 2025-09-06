extends Node2D

func _process(delta):
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_ui(mouse, [160, 160, 960, 80]):
            Func.change_scene_to(self, 'res://scene/level_select.tscn', 'LevelSelect')
