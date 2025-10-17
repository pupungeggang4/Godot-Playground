extends Node2D

func _ready():
    GVar.selected_title = 0
    
func _process(delta):
    handle_input()
    
func handle_input():
    if Input.is_action_just_pressed('up') or Input.is_action_just_pressed('sub_up'):
        GVar.selected_title = (GVar.selected_title + 2) % 3
    elif Input.is_action_just_pressed('down') or Input.is_action_just_pressed('sub_down'):
        GVar.selected_title = (GVar.selected_title + 1) % 3
    if Input.is_action_just_pressed('confirm'):
        if GVar.selected_title == 0:
            get_tree().change_scene_to_file('res://scene/field.tscn')
        elif GVar.selected_title == 1:
            pass
        elif GVar.selected_title == 2:
            get_tree().quit()
