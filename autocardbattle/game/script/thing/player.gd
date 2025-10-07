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

func battle_start():
    deck = []
    deck_crystal = []
    
    for i in range(len(GVar.player.deck)):
        var card = load('res://scene/thing/card.tscn').instantiate()
        card.clone_from_card(GVar.player.deck[i])
        deck.append(card)
        
    for i in range(len(GVar.player.deck_crystal)):
        var crystal = load('res://scene/thing/crystal.tscn').instantiate()
        crystal.clone_from_crystal(GVar.player.deck_crystal[i])
        
    deck.shuffle()
    deck_crystal.shuffle()
    
    var node_ui_card_player = get_node('/root/Battle/UI/CardPlayer')
    for i in range(len(deck) - 1, -1, -1):
        deck[i].hide()
        node_ui_card_player.add_child(deck[i])

func handle_card_nodes():
    for card in deck:
        card.hide()
    for i in range(5):
        deck[i].show()
        deck[i].position = Vector2(UI.card_player_start[0] + UI.card_player_interval[0] * i, UI.card_player_start[1])
        deck[i].apply_data_to_node()
