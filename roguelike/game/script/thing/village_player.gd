extends Node2D

@onready var node_village = get_node('/root/Village')
@onready var node_field_portal = get_node('/root/Village/FieldPortal')
@onready var node_field_shop = get_node('/root/Village/FieldShop')
@onready var node_field_progress = get_node('/root/Village/FieldProgress')

var speed = 320.0

func _ready():
    pass
    
func _process(delta):
    if node_village.menu == false:
        if node_village.state == '':
            move_player(delta)
            field_interact()
            
func move_player(delta):
    var x_pressed = false
    var y_pressed = false
    
    var velocity = Vector2(0, 0)
    
    if Input.is_action_pressed('left'):
        velocity.x += -1
        x_pressed = true
    if Input.is_action_pressed('right'):
        velocity.x += 1
        x_pressed = true
    if Input.is_action_pressed('up'):
        velocity.y += -1
        y_pressed = true
    if Input.is_action_pressed('down'):
        velocity.y += 1
        y_pressed = true

    if x_pressed == true and y_pressed == true:
        velocity.x *= 0.7; velocity.y *= 0.7
        
    position += velocity * speed * delta

func field_interact():
    if Input.is_action_just_pressed('attack'):
        if (node_field_portal.position - position).length() < 80:
            get_tree().change_scene_to_file('res://scene/battle.tscn')
