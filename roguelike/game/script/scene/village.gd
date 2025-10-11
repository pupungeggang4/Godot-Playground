extends Node2D

var selected_menu = 0
var state = ''
var menu = false

func _ready():
    selected_menu = 0
    state = ''
    menu = false
    
func _process(delta):
    handle_key()
    
func handle_key():
    if menu == false:
        if Input.is_action_just_pressed('back'):
            menu = true
            selected_menu = 0
    elif menu == true:
        if Input.is_action_just_pressed('back'):
            menu = false
        if Input.is_action_just_pressed('up'):
            selected_menu = (selected_menu + 1) % 2
        if Input.is_action_just_pressed('down'):
            selected_menu = (selected_menu + 1) % 2
        if Input.is_action_just_pressed('confirm'):
            if selected_menu == 0:
                menu = false
            if selected_menu == 1:
                menu = false
                get_tree().change_scene_to_file('res://scene/title.tscn')
