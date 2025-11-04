extends Node2D

@onready var proj = get_tree().current_scene.get_node('Proj')

var speed = 320.0
var level = 0; var exp_point = 0; var exp_max = 0; var gold = 0
var hp = 0; var hp_max = 0; var energy = 0; var energy_max = 0;
var attack_speed = 1.0; var attack = 10; var attack_cool = 1.0;

func _ready():
    pass

func start_adventure():
    level = 1; exp_point = 0; exp_max = 20; gold = 0; hp = 120; hp_max = 120; energy = 0; energy_max = 8;

func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
            handle_key()
            handle_mouse()
            move_player(delta)
            if attack_cool >= 0:
                attack_cool -= delta
    
func move_player(delta):
    var x_pressed = false
    var y_pressed = false
    var velocity = Vector2(0, 0)
    
    if Input.is_action_pressed('left'):
        x_pressed = true
        velocity.x -= 1
    if Input.is_action_pressed('right'):
        x_pressed = true
        velocity.x += 1
    if Input.is_action_pressed('up'):
        y_pressed = true
        velocity.y -= 1
    if Input.is_action_pressed('down'):
        y_pressed = true
        velocity.y += 1
    if x_pressed == true and y_pressed == true:
        velocity *= 0.7
    position.x += velocity.x * speed * delta
    position.y += velocity.y * speed * delta

func handle_key():
    pass
    
func handle_mouse():
    if Input.is_action_just_pressed('mouse'):
        var mouse = get_viewport().get_mouse_position()
        var pos = mouse + position - Vector2(640, 360)
        shoot(pos)
        
func shoot(pos):
    if attack_cool <= 0:
        if (position - pos).length() >= 10:
            var diff_n = (pos - position).normalized()
            var tmp_proj = Asset.entity.projectile.instantiate()
            tmp_proj.position = Vector2(position.x, position.y)
            tmp_proj.direction = diff_n
            proj.add_child(tmp_proj)
            attack_cool = 1.0
