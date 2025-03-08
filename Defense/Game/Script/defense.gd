extends Node2D

var rect_button_start

func _ready():
    rect_button_start = get_node("UI/Window/Start/ColorRect").get_global_rect()
    print(rect_button_start.size)

func _process(delta: float):
    handle_input()
    
func handle_input():
    if Input.is_action_just_released("mouse_left"):
        var mouse = get_viewport().get_mouse_position()
        if GlobalVar.state == "start":
            if Physics.point_inside_rect(mouse, rect_button_start):
                GlobalVar.state = ""
                get_node("UI/Window/Start").hide()
                start_game()
                
func start_game():
    var node_field = get_node("Field")
    for i in range(4):
        var spawn = load("res://Scene/Thing/spawn.tscn").instantiate()
        spawn.position = Vector2(800, 240 + i * 80)
        node_field.get_node("Spawn").add_child(spawn)
