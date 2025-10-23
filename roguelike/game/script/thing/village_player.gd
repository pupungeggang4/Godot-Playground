extends Node2D

@onready var node_field_portal = get_node('/root/Village/VillageEntity/FieldPortal')
@onready var node_field_shop = get_node('/root/Village/VillageEntity/FieldShop')
@onready var node_field_progress = get_node('/root/Village/VillageEntity/FieldProgress')

var speed = 320.0

func _ready():
    pass
    
func _process(delta):
    if GVar.menu == false:
        if GVar.state == '':
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
            GVar.state = 'adventure_confirm'
            GVar.selected_adventure_confirm = 0
