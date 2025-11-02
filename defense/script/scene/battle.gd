extends Node2D

@onready var spawn_points = get_node('SpawnPoints')
@onready var end_points = get_node('EndPoints')
@onready var player = get_node('Player')

var wave = []

func _ready():
    for i in range(4):
        var temp_spawn = load('res://scene/thing/spawn.tscn').instantiate()
        temp_spawn.position.x = 1080
        temp_spawn.position.y = 240 + 80 * i
        spawn_points.add_child(temp_spawn)
        var temp_end_point = load('res://scene/thing/end_point.tscn').instantiate()
        temp_end_point.position.x = 200
        temp_end_point.position.y = 240 + 80 * i
        end_points.add_child(temp_end_point)
