extends Node2D

@export var crystal_num = 0
@export var deck = []
@export var deck_crystal = []
@export var hand_crystal = []
@export var equipment = []

func _ready():
    pass
    
func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            handle_card_nodes()

func battle_start(ID):
    deck = []
    deck_crystal = []
    
    var data_card = Data.enemy[ID].deck.duplicate(true)
    var data_crystal = Data.enemy[ID].crystal.duplicate(true)
    
    for i in range(len(data_card)):
        var card = load('res://scene/thing/card.tscn').instantiate()
        card.set_data(data_card[i])
        deck.append(card)
        
    for i in range(len(data_crystal)):
        var crystal = load('res://scene/thing/crystal.tscn').instantiate()
        crystal.set_data(data_crystal[i])
        deck_crystal.append(crystal)
        
    deck.shuffle()
    deck_crystal.shuffle()
    
    var node_ui_card_player = get_node('/root/Battle/UI/CardEnemy')
    for i in range(len(deck) - 1, -1, -1):
        deck[i].hide()
        node_ui_card_player.add_child(deck[i])

func handle_card_nodes():
    for card in deck:
        card.hide()
    for i in range(5):
        deck[i].show()
        deck[i].position = Vector2(UI.card_enemy_start[0] + UI.card_enemy_interval[0] * i, UI.card_enemy_start[1])
        deck[i].apply_data_to_node()
