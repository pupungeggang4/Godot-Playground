extends Node2D

const UI = {
    'button_start': [320, 160, 640, 80],
    'button_tutorial': [320, 240, 640, 80],
    'button_lang': [320, 320, 640, 80],
    'button_collection': [320, 400, 640, 80],
    'button_quit': [320, 480, 640, 80]
}

func _process(delta):
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_released('mouse'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_ui(mouse, UI['button_start']):
            get_tree().change_scene_to_file("res://scene/battle.tscn")
        elif Func.point_inside_rect_ui(mouse, UI['button_start']):
            get_tree().change_scene_to_file("res://scene/battle.tscn")
        elif Func.point_inside_rect_ui(mouse, UI['button_lang']):
            GVar.lang = (GVar.lang + 1) % len(Locale.lang_list)
            GVar.locale = Locale.data[Locale.lang_list[GVar.lang]]
        elif Func.point_inside_rect_ui(mouse, UI['button_quit']):
            get_tree().quit()
            
