extends Node2D

@onready var hp_bar = get_node('Hpbarfull40')
var hp = 40
var hp_max = 40.0
var attack = 5
var attack_speed = 1.0
var attack_cool = 1.0

func _process(delta):
    handle_attack(delta)
    hp_bar.region_rect.size.x = hp / hp_max * 40.0
    if hp <= 0:
        queue_free()

func handle_attack(delta):
    if attack_cool <= 0:
        attack_cool = 1 / attack_speed
    else:
        attack_cool -= delta
