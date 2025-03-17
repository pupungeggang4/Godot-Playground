extends Node2D

@export var energy = 2
@onready var node_energy = get_node("Energy")

func _ready():
    pass
    
func _process(delta: float):
    node_energy.text = str(energy)
