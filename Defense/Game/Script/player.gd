extends Node2D

@export var hand = []

@export var energy = 4.0
@export var energy_max = 8.0
@export var energy_gen = 1.0

@export var gen_level = 1
@export var gen_upgrade = 4
@export var gen_level_max = 5

@export var life = 20

func _ready():
    hand = []
    
func _process(delta: float):
    if GlobalVar.state == "":
        energy += energy_gen * delta
        if energy > energy_max:
            energy = energy_max
