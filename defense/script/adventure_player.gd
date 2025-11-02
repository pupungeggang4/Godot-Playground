extends Node

class_name AdventurePlayer

var deck = []
var equipment = []

func _init():
    pass
    
func start_adventure():
    deck = []
    for i in range(8):
        var card = Asset.entity.card.instantiate()
        deck.append(card)
