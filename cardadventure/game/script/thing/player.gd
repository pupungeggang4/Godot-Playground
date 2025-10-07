extends Node2D

@export var speed = 320.0

func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            move_player(delta)

func move_player(delta):
    if Input.is_action_pressed('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if Func.point_inside_rect_ui(mouse, UI.button_left):
            position.x -= speed * delta
        if Func.point_inside_rect_ui(mouse, UI.button_right):
            position.x += speed * delta
        if Func.point_inside_rect_ui(mouse, UI.button_up):
            position.y -= speed * delta
        if Func.point_inside_rect_ui(mouse, UI.button_down):
            position.y += speed * delta
            
    if Input.is_action_pressed('left'):
        position.x -= speed * delta
    if Input.is_action_pressed('right'):
        position.x += speed * delta
    if Input.is_action_pressed('up'):
        position.y -= speed * delta
    if Input.is_action_pressed('down'):
        position.y += speed * delta
