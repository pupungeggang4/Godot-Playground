extends Node2D

@onready var player = get_node('/root/Battle/Player')

var type = ''
var amount = 0

func _ready():
    pass
    
func _process(delta):
    if (position - player.position).length() < 60:
        if type == 'coin':
            player.gold += amount
        elif type == 'exporb':
            player.exp_point += amount
            if player.exp_point >= player.exp_max:
                player.exp_point -= player.exp_max
                player.level += 1
                player.exp_max = (player.level + 1) * 10
        queue_free()

func set_data(type, amount):
    self.type = type
    self.amount = amount
    if self.type == 'coin':
        self.get_node('Sprite').texture = GImage.coin
    elif self.type == 'exporb':
        self.get_node('Sprite').texture = GImage.exporb
