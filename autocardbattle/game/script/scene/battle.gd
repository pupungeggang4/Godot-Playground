extends Node2D

@onready var player = get_node('Player')
@onready var enemy = get_node('Enemy')
var turn_num = 0
var turn_who = 0
var turn_phase = 'start'
var turn_process_time = 0.5
var paused = false

var unit_list = [
    null, null, null, null, null, null, null, null, null, null
]

func _ready():
    var node_field = get_node('UI/Field')
    
    for i in range(10):
        var rect = ColorRect.new()
        rect.position = Vector2(UI.unit[i][0], UI.unit[i][1])
        rect.size = Vector2(UI.unit[i][2], UI.unit[i][3])
        node_field.add_child(rect)
        
    get_node('/root/Battle/UI/Window').show()

func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            handle_unit()
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if GVar.menu == false:
            if Func.point_inside_rect_ui(mouse, UI.button_menu):
                GVar.menu = true
                get_node('UI/UIMenu').show()
            if GVar.state == 'reward':
                if Func.point_inside_rect_ui(mouse, UI.button_reward_confirm):
                    GVar.state = ''
                    get_node('/root/Battle/UI/Window').hide()
                    battle_start()
                
        elif GVar.menu == true:
            if Func.point_inside_rect_ui(mouse, UI.button_resume):
                GVar.menu = false
                get_node('UI/UIMenu').hide()
                
            if Func.point_inside_rect_ui(mouse, UI.button_exit):
                GVar.menu = false
                get_node('UI/UIMenu').hide()
                Func.change_scene(self, 'res://scene/title.tscn', 'Title')
                
func handle_unit():
    for i in range(10):
        if unit_list[i] != null:
            unit_list[i].show()
            unit_list[i].position = Vector2(UI.unit[i][0], UI.unit[i][1])
            unit_list[i].apply_data_to_node()
                
func battle_start():
    var node_field = get_node('/root/Battle/UI/Field')
    player.battle_start()
    enemy.battle_start(1)
    var unit_player = load('res://scene/thing/unit.tscn').instantiate()
    unit_player.set_unit_from_player()
    var unit_enemy = load('res://scene/thing/unit.tscn').instantiate()
    unit_enemy.set_unit_from_enemy(1)
    unit_list[0] = unit_player
    node_field.add_child(unit_player)
    unit_list[5] = unit_enemy
    node_field.add_child(unit_enemy)
