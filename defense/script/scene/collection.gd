extends Node2D

func _process(delta):
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_pressed('mouse'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_ui(mouse, UI.UI['button_back']):
            get_tree().change_scene_to_file('res://scene/title.tscn')
