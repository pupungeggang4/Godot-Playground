extends Node2D

@onready var player = get_node('Player')
@onready var enemy = get_node('Enemy')

func _ready():
    var node_field = get_node('UI/Field')
    var node_card_player = get_node('UI/CardPlayer')
    var node_card_enemy = get_node('UI/CardEnemy')
    
    for i in range(10):
        var rect = ColorRect.new()
        rect.position = Vector2(UI.unit[i][0], UI.unit[i][1])
        rect.size = Vector2(UI.unit[i][2], UI.unit[i][3])
        node_field.add_child(rect)
        
    for i in range(4, -1, -1):
        var card = load('res://scene/thing/card.tscn').instantiate()
        card.position = Vector2(UI.card_player_start[0] + UI.card_player_interval[0] * i, UI.card_player_start[1])
        node_card_player.add_child(card)
        
    for i in range(4, -1, -1):
        var card = load('res://scene/thing/card.tscn').instantiate()
        card.position = Vector2(UI.card_enemy_start[0] + UI.card_enemy_interval[0] * i, UI.card_enemy_start[1])
        node_card_enemy.add_child(card)

func _process(delta):
    handle_mouse()
    
func handle_mouse():
    if Input.is_action_just_released('mouse_left'):
        var mouse = get_viewport().get_mouse_position()
        if GVar.menu == false:
            if Func.point_inside_rect_ui(mouse, UI.button_menu):
                GVar.menu = true
                get_node('UI/UIMenu').show()
                
        elif GVar.menu == true:
            if Func.point_inside_rect_ui(mouse, UI.button_resume):
                GVar.menu = false
                get_node('UI/UIMenu').hide()
                
            if Func.point_inside_rect_ui(mouse, UI.button_exit):
                GVar.menu = false
                get_node('UI/UIMenu').hide()
                Func.change_scene(self, 'res://scene/title.tscn', 'Title')
                
func battle_start():
    pass
