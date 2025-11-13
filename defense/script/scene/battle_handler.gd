extends Node

func _ready():
    pass
    
func _process(delta):
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_released('mouse'):
        var mouse = get_viewport().get_mouse_position()
        if GVar.menu == false:
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu']):
                GVar.menu = true
            if GVar.state == '':
                handle_mouse_battle(mouse)
        elif GVar.menu == true:
            if Func.point_inside_rect_ui(mouse, UI.UI['button_resume']) or Func.point_inside_rect_ui(mouse, UI.UI['button_menu']):
                GVar.menu = false
            elif Func.point_inside_rect_ui(mouse, UI.UI['button_to_title']):
                GVar.menu = false
                get_tree().change_scene_to_file('res://scene/title.tscn')
            elif Func.point_inside_rect_ui(mouse, UI.UI['button_quit_game']):
                get_tree().quit()

func handle_mouse_battle(mouse):
    if Func.point_inside_rect_ui(mouse, UI.UI['field_area']):
        var j = int((mouse[0] - UI.UI['field_area'][0])/ 80)
        var i = int((mouse[1] - UI.UI['field_area'][1])/ 80)
        print('%d,%d' % [i, j])
