extends CanvasLayer

@export var click_state = ""
@export var selected_card = -1

@export var hand = [120, 680, 80, 80]

@onready var node_player = get_tree().current_scene.get_node("Player")
@onready var node_field = get_tree().current_scene.get_node("Field")

@onready var node_text_energy = get_node("Lower/Energy")
@onready var node_text_level = get_node("Lower/Level")
@onready var node_text_life = get_node("Lower/Life")
@onready var node_text_gen_upgrade = get_node("Lower/GenUpgrade")
@onready var node_energy_bar_empty = get_node("Lower/EnergyBarEmpty")
@onready var node_energy_bar_full = get_node("Lower/EnergyBarFull")

@onready var node_button_bounce = get_node("Top/ButtonBounce")
@onready var node_button_gen_upgrade = get_node("Lower/ButtonGenUpgrade")

@onready var node_hand = get_node("Hand")

func _ready():
    pass

func _process(delta: float):
    display()
    handle_input()
    
func display():
    node_text_life.text = "{0}".format([node_player.life])
    node_text_level.text = "Lv.{0}".format([node_player.gen_level])
    node_text_energy.text = "{0}/{1}".format(["%0.1f" % node_player.energy, node_player.energy_max])
    
    node_energy_bar_empty.size.x = node_player.energy_max * 20
    node_energy_bar_full.size.x = node_player.energy * 20
    
    if node_player.gen_level < 5:
        node_text_gen_upgrade.text = "{0}".format([node_player.gen_upgrade])
    else:
        node_text_gen_upgrade.text = "Max"
        
    for i in range(len(node_player.hand)):
        node_player.hand[i].position.x = 120 + 80 * i
        node_player.hand[i].position.y = 680

func handle_input():
    if Input.is_action_just_released("mouse_left"):
        var mouse = get_viewport().get_mouse_position()
        
        if GlobalVar.state == "":
            if click_state == "":
                if Physics.point_inside_rect(mouse, node_button_gen_upgrade.get_rect()):
                    if node_player.energy > node_player.gen_upgrade and node_player.gen_level < node_player.gen_level_max:
                        node_player.energy -= node_player.gen_upgrade
                        node_player.gen_level += 1
                        node_player.energy_gen += 0.2
                        node_player.energy_max += 2
                        node_player.gen_upgrade += 2
                
                for i in range(len(node_player.hand)):
                    var hand_rect = [hand[0] + hand[2] * i, hand[1], hand[2], hand[3]]
                    if Physics.point_inside_rect_ui(mouse, hand_rect):
                        selected_card = i
                        click_state = "hand"
                        
            elif click_state == "hand":
                var col = int((mouse.x - 320) / 80)
                var row = int((mouse.y - 200) / 80)
                node_player.play_card(selected_card, row, col)
                selected_card = -1
                click_state = ""
