extends Node2D

@onready var player = get_node('VillagePlayer')

func _ready():
    GVar.state = ''
    GVar.menu = false
    
func _process(delta):
    handle_mouse()
    handle_key()
    
func handle_key():
    if GVar.menu == false:
        if Input.is_action_just_pressed('back'):
            GVar.menu = true
            GVar.selected_menu_village = 0
        if GVar.state == '':
            if Input.is_action_just_pressed('interact'):
                player.field_interact()
        elif GVar.state == 'adventure_confirm':
            if Input.is_action_just_pressed('left'):
                GVar.selected_adventure_confirm = (GVar.selected_adventure_confirm + 1) % 2
            elif Input.is_action_just_pressed('right'):
                GVar.selected_adventure_confirm = (GVar.selected_adventure_confirm + 1) % 2
            if Input.is_action_just_pressed('confirm'):
                if GVar.selected_adventure_confirm == 0:
                    get_tree().change_scene_to_file('res://scene/battle.tscn')
                    GVar.adventure.start_adventure()
                    GVar.state = 'start'
                    GVar.selected_adventure_start = 0
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
                
func handle_mouse():
    if Input.is_action_just_released('mouse'):
        var mouse = get_viewport().get_mouse_position()
        if GVar.menu == false:
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu']):
                GVar.menu = true
            if GVar.state == '':
                player.field_interact()
            elif GVar.state == 'adventure_confirm':
                if Func.point_inside_rect_ui(mouse, UI.UI['button_yes']):
                    get_tree().change_scene_to_file('res://scene/battle.tscn')
                    GVar.adventure.start_adventure()
                    GVar.state = 'start'
                    GVar.selected_adventure_start = 0
                elif Func.point_inside_rect_ui(mouse, UI.UI['button_no']):
                    GVar.state = ''
        elif GVar.menu == true:
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu_resume']):
                GVar.menu = false
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu_exit']):
                GVar.menu = false
                get_tree().change_scene_to_file('res://scene/title.tscn')
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu_quit']):
                get_tree().quit()
