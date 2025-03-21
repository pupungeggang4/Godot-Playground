extends Node2D

@export var hp = 20.0
@export var hp_max = 20.0
@export var speed = 32.0
@export var side = 0

@onready var node_hp_bar = get_node("HPBarFull")

func _ready():
    pass

func _process(delta: float):
    if GlobalVar.state == "":
        move(delta)
        handle_death()
        handle_hp_bar()

func move(delta):
    if side == 1:
        position.x -= speed * delta

func handle_hp_bar():
    node_hp_bar.size.x = hp / hp_max * 64.0

func handle_death():
    if hp <= 0:
        queue_free()
