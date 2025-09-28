extends Node2D

@export var crystal_num = 0
@export var deck = []
@export var deck_crystal = []
@export var hand_crystal = []
@export var equipment = []

func _ready():
    battle_start(1)
    print(deck[5].crystal)

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
        deck.append(crystal)
        
    deck.shuffle()
    deck_crystal.shuffle()
