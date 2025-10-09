extends Node2D

var state = ''
var menu = false
var selected_menu = 0

func _ready():
    menu = false
    state = ''
    
func _process(delta):
    handle_input()
    
func handle_input():
    if menu == false:
        if Input.is_action_just_pressed('back'):
            menu = true
            selected_menu = 0
        if state == '':
            pass
    else:
        if Input.is_action_just_pressed('back'):
            menu = false
        if Input.is_action_just_pressed('up') or Input.is_action_just_pressed('sub_up'):
            selected_menu = (selected_menu + 2) % 3
        if Input.is_action_just_pressed('down') or Input.is_action_just_pressed('sub_down'):
            selected_menu = (selected_menu + 1) % 3
        if Input.is_action_just_pressed('confirm'):
            if selected_menu == 0:
                menu = false
            elif selected_menu == 1:
                get_tree().change_scene_to_file('res://scene/title.tscn')
            elif selected_menu == 2:
                get_tree().quit()
