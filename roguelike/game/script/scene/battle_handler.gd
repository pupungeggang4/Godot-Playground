extends Node

@onready var battle = get_node('/root/Battle')
@onready var player = get_node('/root/Battle/Player')

func _ready():
    GVar.state = 'start'
    GVar.menu = false
    GVar.selected_reward = -1
    
func _process(delta):
    handle_key()
    handle_mouse()
    
func handle_key():
    if GVar.menu == false:
        if Input.is_action_just_pressed('back'):
            GVar.menu = true
            GVar.selected_menu_battle = 0
        if GVar.state == '':
            pass
        elif GVar.state == 'start':
            handle_key_start()
        elif GVar.state == 'result':
            if Input.is_action_just_pressed('confirm'):
                get_tree().change_scene_to_file('res://scene/village.tscn')
                
    elif GVar.menu == true:
        if Input.is_action_just_pressed('back'):
            GVar.menu = false
        if Input.is_action_just_pressed('up'):
            GVar.selected_menu_battle = (GVar.selected_menu_battle + 3) % 4
        if Input.is_action_just_pressed('down'):
            GVar.selected_menu_battle = (GVar.selected_menu_battle + 1) % 4
        if Input.is_action_just_pressed('confirm'):
            if GVar.selected_menu_battle == 0:
                GVar.menu = false
            elif GVar.selected_menu_battle == 1:
                GVar.menu = false
                GVar.state = 'result'
            elif GVar.selected_menu_battle == 2:
                GVar.menu = false
                GVar.state = ''
                get_tree().change_scene_to_file('res://scene/title.tscn')
            elif GVar.selected_menu_battle == 3:
                get_tree().quit()
                
func handle_key_start():
    if Input.is_action_just_pressed('left'):
        GVar.selected_adventure_start = (GVar.selected_adventure_start + 2) % 3
    if Input.is_action_just_pressed('right'):
        GVar.selected_adventure_start = (GVar.selected_adventure_start + 1) % 3
    if Input.is_action_just_pressed('confirm'):
        GVar.state = ''
        player.start_adventure()
        
func handle_mouse():
    if Input.is_action_just_pressed('mouse'):
        var mouse = get_viewport().get_mouse_position()
        if GVar.menu == false:
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu']):
                GVar.menu = true
            if GVar.state == 'start':
                handle_mouse_start(mouse)
        else:
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu_battle_resume']):
                GVar.menu = false
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu_battle_surrender']):
                GVar.menu = false
                GVar.state = 'result'
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu_battle_exit']):
                GVar.menu = false
                GVar.state = ''
                get_tree().change_scene_to_file('res://scene/title.tscn')
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu_battle_quit']):
                get_tree().quit()

func handle_mouse_start(mouse):
    for i in range(3):
        if Func.point_inside_rect_ui(mouse, UI.UI['button_start_weapon'][i]):
            GVar.selected_adventure_start = i
    if Func.point_inside_rect_ui(mouse, UI.UI['button_start_ok']):
        GVar.state = ''
        player.start_adventure()
