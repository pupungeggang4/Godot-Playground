extends Node2D

func _process(delta):
    handle_input()
    
func handle_input():
    handle_mouse()
    handle_key()

func handle_mouse():
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if GVar.menu == false:
            if Func.point_inside_rect_ui(mouse, UI.button_menu):
                GVar.menu = true
                get_node('UI/FieldMenu').show()
            if GVar.state == '':
                pass
        else:
            if Func.point_inside_rect_ui(mouse, UI.buttton_resume):
                GVar.menu = false
                get_node('UI/FieldMenu').hide()
            elif Func.point_inside_rect_ui(mouse, UI.button_exit):
                GVar.menu = false
                get_node('UI/FieldMenu').hide()
                Func.change_scene(self, 'res://scene/title.tscn', 'Title')
    
func handle_key():
    pass
