extends Node2D

func _process(delta):
    handle_input()
    
func handle_input():
    handle_mouse()
    handle_key()
    
func handle_mouse():
    pass

func handle_key():
    if GVar.menu == false:
        if Input.is_action_just_pressed('menu'):
            GVar.menu = true
            get_node('UI/UIMenu').show()
    else:
        if Input.is_action_just_pressed('menu') or Input.is_action_just_pressed('resume'):
            GVar.menu = false
            get_node('UI/UIMenu').hide()
        if Input.is_action_just_pressed('exit'):
            GVar.menu = false
            get_node('UI/UIMenu').hide()
            GVar.state = ''
            Func.change_scene(self, 'res://scene/title.tscn', 'Title')
