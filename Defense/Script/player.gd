extends Node2D

@export var hand = []
@export var energy = 4.0
@export var energy_max = 8.0
@export var energy_gen = 1.0
@export var gen_level = 1

func _ready():
    hand = []
    
func _process(delta: float):
    if GlobalVar.state == '':
        energy += energy_gen * delta
        if energy > energy_max:
            energy = energy_max
