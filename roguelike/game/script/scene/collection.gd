extends Node2D

var selected = 0

func _ready():
    selected = 0
    
func _process(delta):
    handle_key()
    handle_mouse()
    
func handle_key():
    if Input.is_action_just_pressed('back'):
        get_tree().change_scene_to_file('res://scene/title.tscn')
        
func handle_mouse():
    if Input.is_action_just_released('mouse'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_ui(mouse, UI.UI['button_back']):
            get_tree().change_scene_to_file('res://scene/title.tscn')
