extends Node2D

@onready var hp_bar = get_node('Hpbarfull40')
var hp = 40
var hp_max = 40.0

func _process(delta):
    hp_bar.region_rect.size.x = hp / hp_max * 40.0
    if hp <= 0:
        GVar.tutorial_phase = ''
