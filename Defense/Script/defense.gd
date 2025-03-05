extends Node2D

var rect_button_start

func _ready():
    rect_button_start = get_node("Start/ColorRect").get_global_rect()
    print(rect_button_start.size)

func _process(delta: float) -> void:
    handle_input()
    
func handle_input() -> void:
    if Input.is_action_just_released("mouse_left"):
        var mouse = get_viewport().get_mouse_position()
        if GlobalVar.state == '':
            if Physics.point_inside_rect(mouse, rect_button_start):
                GlobalVar.state = '1'
                get_node('Start').hide()
