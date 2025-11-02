extends Control

@onready var player = get_owner().get_node('Player')
@onready var text_level = get_node('TextLevel')
@onready var text_life = get_node('TextLife')
@onready var text_energy = get_node('TextEnergy')

func _ready():
    pass
    
func _process(delta):
    text_level.text = 'Lv.%d' % [player.level]
    text_life.text = '%d' % [player.life]
    text_energy.text = '%.1f/%d' % [player.energy, player.energy_max]
