extends Node2D

var type = ''
var amount = ''

func _ready():
    pass
    
func set_data(type, amount):
    self.type = type
    self.amount = amount
    if self.type == 'coin':
        self.get_node('Sprite').texture = GImage.coin
    elif self.type == 'exporb':
        self.get_node('Sprite').texture = GImage.exporb
