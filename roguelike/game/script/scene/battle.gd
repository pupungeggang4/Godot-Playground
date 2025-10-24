extends Node2D

@onready var node_drop = get_node('/root/Battle/Drop')
@onready var node_player = get_node('/root/Battle/Player')

var unit = []
#var drop = []
var proj = []

func _ready():
    spawn_drop('coin', 10, Vector2(80, 80))
    spawn_drop('exporb', 10, Vector2(-80, -80))
    
func _process(delta):
    pass

func spawn_drop(type, value, pos):
    var node = load('res://scene/thing/drop.tscn').instantiate()
    node.position = pos
    node.set_data(type, value)
    #drop.append(node)
    node_drop.add_child(node)
