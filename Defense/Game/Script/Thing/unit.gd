extends Node2D

@export var hp = 20.0
@export var hp_max = 20.0
@export var speed = 200.0

func _ready():
    pass

func _process(delta: float):
    move(delta)
    handle_death()

func move(delta):
    position.x -= speed * delta

func handle_death():
    hp -= 0.1
    if hp <= 0:
        queue_free()
