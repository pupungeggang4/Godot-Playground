extends Node2D

func _ready():
    get_node('UI/ButtonSelected').hide()

func _process(delta):
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_pressed('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        for i in range(6):
            if Func.point_inside_rect_ui(mouse, UI.character[i]):
                GVar.selected_character = i
                get_node('UI/ButtonSelected').show()
                get_node('UI/ButtonSelected').position = Vector2(UI.character[i][0], UI.character[i][1])
                
            if Func.point_inside_rect_ui(mouse, UI.button_game_start):
                if GVar.selected_character != -1:
                    Func.change_scene(self, 'res://scene/battle.tscn', 'Battle')
        
