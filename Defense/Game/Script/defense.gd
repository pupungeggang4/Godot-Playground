extends Node2D

var rect_button_start
var time = 0
var wave = [[2, [1, 1, 1]], [2.2, [1, 1, 1]], [2.4, [1, 1, 1]], [4, [1, 1, 1]], [4.2, [1, 1, 1]], [4.4, [1, 1, 1]], [6, [1, 1, 1]], [8, [1, 1, 1]]]
var spawners = []
@onready var rnd = RandomNumberGenerator.new()

func _ready():
    rect_button_start = get_node("UI/Window/Start/ColorRect").get_global_rect()
    print(rect_button_start.size)

func _process(delta: float):
    if GlobalVar.state == "":
        for i in range(len(wave) - 1, -1, -1):
            wave[i][0] -= delta
            if wave[i][0] <= 0:
                var sampled = Game.sample(range(4), 3)
                for j in range(len(sampled)):
                    spawners[sampled[j]].spawn_unit()
                wave.pop_at(i)
                
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
        spawn.position = Vector2(1000, 240 + i * 80)
        node_field.get_node("Spawn").add_child(spawn)
        spawners.append(spawn)
        var end = load("res://Scene/Thing/end.tscn").instantiate()
        end.position = Vector2(280, 240 + i * 80)
        node_field.get_node("End").add_child(end)
    time = 0
