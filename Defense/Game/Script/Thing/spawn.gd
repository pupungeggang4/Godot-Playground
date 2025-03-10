extends Node2D

@onready var node_unit = get_tree().current_scene.get_node("Field/Unit")

func _ready():
    spawn_unit()

func _process(delta: float):
    pass

func spawn_unit():
    var unit = load("res://Scene/Thing/unit.tscn").instantiate()
    unit.position = Vector2(position.x, position.y)
    unit.side = 1
    node_unit.add_child(unit)
