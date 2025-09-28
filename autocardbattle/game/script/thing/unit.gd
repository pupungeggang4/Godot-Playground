extends Node2D

@export var ID = 0
@export var attack = 0
@export var hp = 0
@export var hp_max = 0
@export var effect = []

func set_unit_from_player():
    self.ID = 9999
    self.attack = 0
    self.hp = GVar.player.hp
    self.hp_max = GVar.player.hp
    self.effect = []
    
func set_unit_from_enemy(ID):
    var data = Data.enemy[ID].duplicate(true)
    self.ID = 9998
    self.attack = 0
    self.hp = data.hp
    self.hp_max = data.hp
    self.effect = []
    
func apply_data_to_node():
    get_node('TextAttack').text = str(self.attack)
    get_node('TextHP').text = str(self.hp)
