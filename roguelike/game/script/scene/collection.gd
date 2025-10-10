extends Node2D

var selected = 0

func _ready():
    selected = 0
    
func _process(delta):
    handle_key()
    
func handle_key():
    if Input.is_action_just_pressed('back'):
        get_tree().change_scene_to_file('res://scene/title.tscn')
