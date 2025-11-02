extends Node2D

@onready var projectile = get_tree().current_scene.get_node('Projectile')
@onready var hp_bar = get_node('Hpbarfull80')
var hp = 20
var hp_max = 40.0
var attack_cool = 1.0
var attack_speed = 1.0

func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            handle_attack(delta)
            hp_bar.region_rect.size.x = hp / hp_max * 80.0

func handle_attack(delta):
    if attack_cool <= 0:
        var proj = Asset.entity.projectile.instantiate()
        proj.position.x = position.x
        proj.position.y = position.y
        projectile.add_child(proj)
        attack_cool = 1 / attack_speed
    else:
        attack_cool -= delta
