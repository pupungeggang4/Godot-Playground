extends Node2D

func _process(delta):
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_released('mouse'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_ui(mouse, UI.UI['button_start']):
            get_tree().change_scene_to_file("res://scene/battle.tscn")
            GVar.menu = false
            GVar.state = ''
        elif Func.point_inside_rect_ui(mouse, UI.UI['button_tutorial']):
            get_tree().change_scene_to_file("res://scene/tutorial.tscn")
            GVar.menu = false
            GVar.state = 'tutorial_break'
        elif Func.point_inside_rect_ui(mouse, UI.UI['button_lang']):
            GVar.lang = (GVar.lang + 1) % len(Locale.lang_list)
            GVar.locale = Locale.data[Locale.lang_list[GVar.lang]]
        elif Func.point_inside_rect_ui(mouse, UI.UI['button_collection']):
            get_tree().change_scene_to_file("res://scene/collection.tscn")
        elif Func.point_inside_rect_ui(mouse, UI.UI['button_quit']):
            get_tree().quit()
            
