extends Node2D

var state = ''
var menu = false
var selected_menu = 0

func _ready():
    state = ''
    menu = false
    selected_menu = 0
    
func _process(delta):
    handle_key()
    
func handle_key():
    if menu == false:
        if Input.is_action_just_pressed('back'):
            menu = true
            selected_menu = 0
        if state == '':
            pass
        elif state == 'result':
            if Input.is_action_just_pressed('confirm'):
                get_tree().change_scene_to_file('res://scene/village.tscn')
    elif menu == true:
        if Input.is_action_just_pressed('back'):
            menu = false
        if Input.is_action_just_pressed('up'):
            selected_menu = (selected_menu + 2) % 3
        if Input.is_action_just_pressed('down'):
            selected_menu = (selected_menu + 1) % 3
        if Input.is_action_just_pressed('confirm'):
            if selected_menu == 0:
                menu = false
            elif selected_menu == 1:
                menu = false
                state = 'result'
            elif selected_menu == 2:
                get_tree().quit()
