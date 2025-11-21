extends Sprite2D

@export var speed = 320.0
@export var light = true
@onready var node_light = get_node('PlayerLight')
@onready var enemy_list = get_node('/root/Main/EnemyList')
@onready var main = get_node('/root/Main')

func _ready():
    position = Vector2(640, 360)

func _process(delta):
    if main.state == '':
        if Input.is_action_just_pressed('toggle'):
            if light == true:
                node_light.hide()
                light = false
            else:
                node_light.show()
                light = true
        if Input.is_action_pressed('ui_left'):
            position.x -= speed * delta
        if Input.is_action_pressed('ui_right'):
            position.x += speed * delta
        if Input.is_action_pressed('ui_up'):
            position.y -= speed * delta
        if Input.is_action_pressed('ui_down'):
            position.y += speed * delta
            
        for e in enemy_list.get_children():
            if (e.position - position).length() < 80:
                main.state = 'game_over'
    elif main.state == 'game_over':
        if Input.is_action_just_pressed('enter'):
            get_tree().change_scene_to_file('res://scene/title.tscn')
            
