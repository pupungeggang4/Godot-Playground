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
    for i in range(len(crystal)):
        var card_crystal = load('res://scene/thing/card_crystal.tscn').instantiate()
        card_crystal.get_node('TextNum').text = str(crystal[i][1])
        var color
        if crystal[i][0] == 'any':
            color = Color(0.8, 0.8, 0.8)
        elif crystal[i][0] == 'fire':
            color = Color(1.0, 0.5, 0.5)
        elif crystal[i][0] == 'water':
            color = Color(0.5, 0.5, 1.0)
        elif crystal[i][0] == 'wind':
            color = Color(0.5, 1.0, 0.5)
        elif crystal[i][0] == 'earth':
            color = Color(0.75, 0.75, 0.0)
        elif crystal[i][0] == 'light':
            color = Color(1.0, 1.0, 0.0)
        elif crystal[i][0] == 'dark':
            color = Color(0.75, 0.0, 0.75)
        card_crystal.get_node('Background').color = color
        card_crystal.position = Vector2(40 * i, 0)
        get_node('Crystal').add_child(card_crystal)

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
