extends Node2D

func _ready():
    pass
    
func _process(delta):
    handle_key()
    
func handle_key():
    if Input.is_action_just_pressed('up'):
        GVar.selected_title = (GVar.selected_title + 3) % 4
    if Input.is_action_just_pressed('down'):
        GVar.selected_title = (GVar.selected_title + 1) % 4
    if Input.is_action_just_pressed('confirm'):
        if GVar.selected_title == 0:
            get_tree().change_scene_to_file('res://scene/village.tscn')
        elif GVar.selected_title == 1:
            get_tree().change_scene_to_file('res://scene/collection.tscn')
        elif GVar.selected_title == 2:
            pass
        elif GVar.selected_title == 3:
            get_tree().quit()
