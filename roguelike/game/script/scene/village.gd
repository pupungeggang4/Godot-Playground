extends Node2D

func _ready():
    GVar.state = ''
    GVar.menu = false
    
func _process(delta):
    handle_key()
    
func handle_key():
    if GVar.menu == false:
        if Input.is_action_just_pressed('back'):
            GVar.menu = true
            GVar.selected_menu_village = 0
        if GVar.state == 'adventure_confirm':
            if Input.is_action_just_pressed('left'):
                GVar.selected_adventure_confirm = (GVar.selected_adventure_confirm + 1) % 2
            elif Input.is_action_just_pressed('right'):
                GVar.selected_adventure_confirm = (GVar.selected_adventure_confirm + 1) % 2
            if Input.is_action_just_pressed('confirm'):
                if GVar.selected_adventure_confirm == 0:
                    get_tree().change_scene_to_file('res://scene/battle.tscn')
                    GVar.adventure.start_adventure()
                    GVar.state = 'start'
                else:
                    GVar.state = ''
            
    elif GVar.menu == true:
        if Input.is_action_just_pressed('back'):
            GVar.menu = false
        if Input.is_action_just_pressed('up'):
            GVar.selected_menu_village = (GVar.selected_menu_village + 2) % 3
        if Input.is_action_just_pressed('down'):
            GVar.selected_menu_village = (GVar.selected_menu_village + 1) % 3
        if Input.is_action_just_pressed('confirm'):
            if GVar.selected_menu_village == 0:
                GVar.menu = false
            if GVar.selected_menu_village == 1:
                GVar.menu = false
                get_tree().change_scene_to_file('res://scene/title.tscn')
            if GVar.selected_menu_village == 2:
                get_tree().quit()
