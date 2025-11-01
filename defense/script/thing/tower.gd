extends Node2D

@onready var hp_bar = get_node('Hpbarfull80')
var hp = 20
var hp_max = 40.0

func _process(delta):
    hp_bar.region_rect.size.x = hp / hp_max * 80.0
