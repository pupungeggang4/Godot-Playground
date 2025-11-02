extends Node

@onready var battle = get_owner()

func _ready():
    pass
    
func _process(delta):
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_released('mouse'):
        var mouse = get_viewport().get_mouse_position()
        if GVar.menu == false:
            if Func.point_inside_rect_ui(mouse, UI.UI['button_menu']):
                GVar.menu = true
            if GVar.state == 'tutorial_break':
                if GVar.tutorial_phase == 'welcome':
                    GVar.tutorial_phase = 'explain'
                elif GVar.tutorial_phase == 'explain':
                    GVar.tutorial_phase = 'play_card'
            
        elif GVar.menu == true:
            if Func.point_inside_rect_ui(mouse, UI.UI['button_resume']) or Func.point_inside_rect_ui(mouse, UI.UI['button_menu']):
                GVar.menu = false
            elif Func.point_inside_rect_ui(mouse, UI.UI['button_to_title']):
                GVar.menu = false
                get_tree().change_scene_to_file('res://scene/title.tscn')
            elif Func.point_inside_rect_ui(mouse, UI.UI['button_quit_game']):
                get_tree().quit()
