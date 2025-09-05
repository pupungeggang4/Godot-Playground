extends Node2D

func _process(delta):
    handle_input()
    
func handle_input():
    handle_mouse()
        
func handle_mouse():
    if Input.is_action_just_released('mouse_left'):
        var pos = get_viewport().get_mouse_position()
        if Func.point_inside_rect_ui(pos, UI.button_start_game):
            Func.change_scene(self, 'res://scene/field.tscn', 'Field')
