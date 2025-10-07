extends Node2D

@export var ID = 0
@export var card_name = 'name'
@export var type = ''
@export var element = ''
@export var attack = 0
@export var hp = 0
var crystal = []
var effect = []
var description = ''

func _ready():
    pass
    
func set_data(ID):
    self.ID = ID
    var data = Data.card[ID].duplicate(true)
    var data_e = Data.card_e[ID]
    var data_d = Data.card_d[ID]

    card_name = data.name
    type = data.type
    element = data.element
    attack = data.stat[0]
    hp = data.stat[1]
    crystal = data.crystal
    effect = data_e
    description = data_d
    apply_data_to_node()
    
func apply_data_to_node():
    for i in range(3):
        var card_crystal = get_node('Crystal/CardCrystal' + str(i + 1))
        if i < len(crystal):
            card_crystal.get_node('TextNum').text = str(crystal[i][1])
            card_crystal.get_node('Crystal').texture = Res.img.crystal[crystal[i][0]]
            card_crystal.position = Vector2(40 * i, 0)
            card_crystal.show()
        else:
            card_crystal.hide()

    get_node('TextName').text = card_name
    get_node('TextDescription').text = description
    
    if type == 'unit':
        get_node('TextAttack').text = str(attack)
        get_node('TextHP').text = str(hp)

func clone_from_card(card):
    self.ID = card.ID
    self.card_name = card.card_name
    self.type = card.type
    self.element = card.element
    self.attack = card.attack
    self.hp = card.hp
    self.crystal = card.crystal.duplicate(true)
    self.effect = card.effect.duplicate(true)
    self.description = card.description
