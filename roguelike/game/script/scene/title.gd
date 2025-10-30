extends Node2D

const UI = {
    'button_start': [160, 160, 960, 80],
    'button_collection': [160, 240, 960, 80],
    'button_lang': [160, 320, 960, 80],
    'button_erase': [160, 400, 960, 80],
    'button_quit': [160, 480, 960, 80]
}

func _ready():
    pass
    
func _process(delta):
    handle_mouse()
    handle_key()
    
func handle_mouse():
    if Input.is_action_just_pressed('mouse'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_ui(mouse, UI['button_start']):
            get_tree().change_scene_to_file('res://scene/battle.tscn')
        if Func.point_inside_rect_ui(mouse, UI['button_collection']):
            get_tree().change_scene_to_file('res://scene/collection.tscn')
        if Func.point_inside_rect_ui(mouse, UI['button_lang']):
            GVar.lang = (GVar.lang + 1) % len(Locale.lang_list)
            GVar.locale = Locale.data[Locale.lang_list[GVar.lang]]
        if Func.point_inside_rect_ui(mouse, UI['button_erase']):
            pass
        if Func.point_inside_rect_ui(mouse, UI['button_start']):
            get_tree().quit()
    
func handle_key():
    if Input.is_action_just_pressed('up'):
        GVar.selected_title = (GVar.selected_title + 4) % 5
    if Input.is_action_just_pressed('down'):
        GVar.selected_title = (GVar.selected_title + 1) % 5
    if Input.is_action_just_pressed('confirm'):
        if GVar.selected_title == 0:
            get_tree().change_scene_to_file('res://scene/village.tscn')
        elif GVar.selected_title == 1:
            get_tree().change_scene_to_file('res://scene/collection.tscn')
        elif GVar.selected_title == 2:
            GVar.lang = (GVar.lang + 1) % len(Locale.lang_list)
            GVar.locale = Locale.data[Locale.lang_list[GVar.lang]]
        elif GVar.selected_title == 3:
            pass
        elif GVar.selected_title == 4:
            get_tree().quit()
