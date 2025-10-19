extends Node2D

func _ready():
    GVar.state = 'start'
    GVar.menu = false
    GVar.selected_reward = -1
    
func _process(delta):
    handle_key()
    print(GVar.state)
    
func handle_key():
    if GVar.menu == false:
        if Input.is_action_just_pressed('back'):
            GVar.menu = true
            GVar.selected_menu_battle = 0
        if GVar.state == '':
            pass
        elif GVar.state == 'start':
            handle_start()
        elif GVar.state == 'result':
            if Input.is_action_just_pressed('confirm'):
                get_tree().change_scene_to_file('res://scene/village.tscn')
                
    elif GVar.menu == true:
        if Input.is_action_just_pressed('back'):
            GVar.menu = false
        if Input.is_action_just_pressed('up'):
            GVar.selected_menu_battle = (GVar.selected_menu_battle + 2) % 3
        if Input.is_action_just_pressed('down'):
            GVar.selected_menu_battle = (GVar.selected_menu_battle + 1) % 3
        if Input.is_action_just_pressed('confirm'):
            if GVar.selected_menu_battle == 0:
                GVar.menu = false
            elif GVar.selected_menu_battle == 1:
                GVar.menu = false
                GVar.state = 'result'
            elif GVar.selected_menu_battle == 2:
                get_tree().quit()
                
func handle_start():
    if Input.is_action_just_pressed('confirm'):
        GVar.state = ''
