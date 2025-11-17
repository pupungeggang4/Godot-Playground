extends Sprite2D

func _process(delta):
    if Input.is_action_pressed('ui_left'):
        position.x -= 320.0 * delta
    if Input.is_action_pressed('ui_right'):
        position.x += 320.0 * delta
    if Input.is_action_pressed('ui_up'):
        position.y -= 320.0 * delta
    if Input.is_action_pressed('ui_down'):
        position.y += 320.0 * delta
