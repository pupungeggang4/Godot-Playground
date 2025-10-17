extends Node2D

func _ready():
    GVar.menu = false
    GVar.state = ''
    
func _process(delta):
    handle_input()
    
func handle_input():
    if GVar.menu == false:
        if Input.is_action_just_pressed('back'):
            GVar.menu = true
            GVar.selected_menu = 0
        if GVar.state == '':
            pass
    else:
        if Input.is_action_just_pressed('back'):
            GVar.menu = false
        if Input.is_action_just_pressed('up') or Input.is_action_just_pressed('sub_up'):
            GVar.selected_menu = (GVar.selected_menu + 2) % 3
        if Input.is_action_just_pressed('down') or Input.is_action_just_pressed('sub_down'):
            GVar.selected_menu = (GVar.selected_menu + 1) % 3
        if Input.is_action_just_pressed('confirm'):
            if GVar.selected_menu == 0:
                GVar.menu = false
            elif GVar.selected_menu == 1:
                get_tree().change_scene_to_file('res://scene/title.tscn')
            elif GVar.selected_menu == 2:
                get_tree().quit()
