extends Node2D

func _process(delta):
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_ui(mouse, UI.button_start):
            Func.change_scene(self, 'res://scene/character_select.tscn', 'CharacterSelect')
            GVar.state = ''
            GVar.menu = false
            GVar.selected_character = -1
            
        if Func.point_inside_rect_ui(mouse, UI.button_collection):
            Func.change_scene(self, 'res://scene/collection.tscn', 'Collection')
            GVar.collection_tab = 0
