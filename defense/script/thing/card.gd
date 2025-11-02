extends Node2D

@onready var text_energy = get_node('TextEnergy')
@onready var text_stat = get_node('TextStat')

var ID = 0
var energy = 2
var type = 'unit'
var stat = [5, 1, 50]

func _ready():
    pass
    
func _process(delta):
    text_energy.text = '%d' % [energy]
    text_stat.text = '%d/%d' % [stat[0], stat[2]]
    var index = get_index()
    position.x = 120 + 80 * index
    position.y = 620
    
func set_data(ID):
    self.ID = ID
    
func clone():
    var cloned = Asset.entity.card.instantiate()
    cloned.ID = ID
    cloned.energy = energy
    cloned.type = type
    cloned.stat = stat.duplicate(true)
    return cloned
