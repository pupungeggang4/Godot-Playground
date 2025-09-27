extends Node

func generate_character(ID):
    GVar.player.hp = 30
    GVar.player.deck = []
    GVar.player.deck_crystal = []
    GVar.player.equipment = []
    GVar.player.gold = 50
    
    var data_deck = Data.character[ID].deck.duplicate(true)
    var data_crystal = Data.character[ID].crystal.duplicate(true)
    
    for i in range(len(data_deck)):
        var card = load('res://scene/thing/card.tscn').instantiate()
        card.set_data(data_deck[i])
        GVar.player.deck.append(card)
        
    for i in range(len(data_crystal)):
        var crystal = load('res://scene/thing/crystal.tscn').instantiate()
        crystal.set_data(data_crystal[i])
        GVar.player.deck_crystal.append(crystal)
