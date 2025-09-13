extends Node2D

func _ready():
    pass
    
func _process(delta):
    handle_input()
    
func handle_input():
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_pressed('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if GVar.menu == false:
            if Func.point_inside_rect_ui(mouse, UI.button_menu):
                GVar.menu = true
                get_node('UI/Menu').show()
        elif GVar.menu == true:
            if Func.point_inside_rect_ui(mouse, UI.button_menu_resume):
                GVar.menu = false
                get_node('UI/Menu').hide()
            elif Func.point_inside_rect_ui(mouse, UI.button_menu_exit):
                GVar.menu = false
                Func.change_scene(self, 'res://scene/title.tscn', 'Title')
                get_node('UI/Menu').hide()
