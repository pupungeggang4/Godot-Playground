extends Node2D

var selected = 0

func _ready():
    selected = 0
    
func _process(delta):
    handle_key()
    
func handle_key():
    if Input.is_action_just_pressed('up'):
        selected = (selected + 3) % 4
    if Input.is_action_just_pressed('down'):
        selected = (selected + 1) % 4
    if Input.is_action_just_pressed('confirm'):
        if selected == 0:
            get_tree().change_scene_to_file('res://scene/village.tscn')
        elif selected == 1:
            get_tree().change_scene_to_file('res://scene/collection.tscn')
        elif selected == 2:
            pass
        elif selected == 3:
            get_tree().quit()
