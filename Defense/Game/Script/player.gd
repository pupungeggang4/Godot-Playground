extends Node2D

@export var hand = []
@export var deck = []

@export var energy = 4.0
@export var energy_max = 8.0
@export var energy_gen = 1.0

@export var gen_level = 1
@export var gen_upgrade = 4
@export var gen_level_max = 5

@export var life = 20

@onready var node_unit = get_tree().current_scene.get_node("Field/Unit")

func _ready():
    hand = []
    deck = []
    
func _process(delta: float):
    if GlobalVar.state == "":
        energy += energy_gen * delta
        if energy > energy_max:
            energy = energy_max
            
func play_card(index, row, col):
    if index < len(hand):
        var card = hand[index]
        if energy > card.energy:
            energy -= card.energy
            spawn_unit("", row, col)
            hand.pop_at(index)
            card.queue_free()
            
func spawn_unit(unit_info, row, col):
    print(row, col)
    var unit = load("res://Scene/Thing/unit.tscn").instantiate()
    unit.get_node("Image").texture = load("res://Image/Unit001.png")
    unit.position = Vector2(360 + 80 * col, 240 + 80 * row)
    node_unit.add_child(unit)
