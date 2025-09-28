extends Node2D

@export var ID = 0
@export var crystal_name = ''
@export var element = ''
@export var effect = []
@export var description = []

func _ready():
    pass
    
func set_data(ID):
    self.ID = ID
    var data = Data.crystal[ID].duplicate(true)
    var data_d = Data.crystal_d[ID]
    crystal_name = data.name
    element = data.element
    effect = data.effect
    description = data_d
    
func clone_from_crystal(crystal):
    self.ID = crystal.ID
    self.crystal_name = crystal.crystal_name
    self.element = crystal.element
    self.effect = crystal.effect.duplicate(true)
    self.description = crystal.description

func _process(delta):
    pass
