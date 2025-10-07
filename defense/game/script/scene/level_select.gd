extends Node

func _ready():
    for i in range(3):
        for j in range(6):
            var node_button = load('res://scene/ui_part/level_button.tscn').instantiate()
            node_button.get_node('LevelNum').text = str(i * 6 + j + 1)
            node_button.size = Vector2(UI.button_level_size[0], UI.button_level_size[1])
            node_button.position = Vector2(UI.button_level_start[0] + UI.button_level_interval[0] * j, UI.button_level_start[1] + UI.button_level_interval[1] * i)
            get_node('UI').add_child(node_button)

func _process(delta):
    handle_input()
    
func handle_input():
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        for i in range(3):
            for j in range(6):
                var rect = [UI.button_level_start[0] + UI.button_level_interval[0] * j, UI.button_level_start[1] + UI.button_level_interval[1] * i, UI.button_level_size[0], UI.button_level_size[1]]
                if Func.point_inside_rect_ui(mouse, rect):
                    Func.change_scene_to(self, 'res://scene/game.tscn', 'Game')
