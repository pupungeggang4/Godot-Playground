extends Control

@onready var player = get_node('/root/Battle/Player')
@onready var exp_bar_full = get_node('ExpBarFull')
@onready var text_exp = get_node('TextExp')
@onready var text_gold = get_node('TextGold')
@onready var text_hp = get_node('TextHP')
@onready var text_energy = get_node('TextEnergy')

func _process(delta):
    exp_bar_full.size.x = 1240.0 * player.exp_point / player.exp_max
    text_exp.text = 'Lv.%d Exp:%d/%d' % [player.level, player.exp_point, player.exp_max]
    text_gold.text = '%d' % [player.gold]
    text_hp.text = '%d/%d' % [player.hp, player.hp_max]
    text_energy.text = '%d/%d' % [player.energy, player.energy_max]
