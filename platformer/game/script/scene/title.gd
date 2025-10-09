extends Node2D

var selected = 0

func _ready():
    pass
    
func _process(delta):
    handle_input()
    
func handle_input():
    if Input.is_action_just_pressed('up') or Input.is_action_just_pressed('sub_up'):
        selected = (selected + 2) % 3
    elif Input.is_action_just_pressed('down') or Input.is_action_just_pressed('sub_down'):
        selected = (selected + 1) % 3
    if Input.is_action_just_pressed('confirm'):
        if selected == 0:
            get_tree().change_scene_to_file('res://scene/field.tscn')
        elif selected == 1:
            pass
        elif selected == 2:
            get_tree().quit()
