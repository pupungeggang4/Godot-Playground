extends Node

var selected_item = 0

func _ready():
    selected_item = 0
    get_node('UI/Arrow').position = Vector2(80, 160)
    
func _process(delta):
    handle_input()
    
func handle_input():
    handle_key()
    
func handle_key():
    if Input.is_action_just_pressed('down') or Input.is_action_just_pressed('c_down'):
        selected_item = (selected_item + 1) % 2
        get_node('UI/Arrow').position.y = 160 + selected_item * 80
    if Input.is_action_just_pressed('jump') or Input.is_action_just_pressed('c_up'):
        selected_item = (selected_item + 1) % 2
        get_node('UI/Arrow').position.y = 160 + selected_item * 80
    
    if Input.is_action_just_pressed('select'):
        if selected_item == 0:
            Func.change_scene(self, 'res://scene/game.tscn', 'Game')
