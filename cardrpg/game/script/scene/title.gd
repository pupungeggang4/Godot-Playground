extends Node2D

func _ready():
    pass
    
func _process(delta):
    handle_input()
    
func handle_input():
    handle_mouse()

func handle_mouse():
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_ui(mouse, UI.button_start):
            Func.change_scene(self, 'res://scene/field.tscn', 'Field')
            GVar.menu = false
            GVar.state = ''
