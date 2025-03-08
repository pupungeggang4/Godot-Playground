extends CanvasLayer

@export var click_state = ""

@onready var node_player = get_tree().current_scene.get_node("Player")
@onready var node_field = get_tree().current_scene.get_node("Field")

@onready var node_text_energy = get_node("Lower/Energy")
@onready var node_text_level = get_node("Lower/Level")
@onready var node_text_life = get_node("Lower/Life")
@onready var node_text_gen_upgrade = get_node("Lower/GenUpgrade")
@onready var node_energy_bar_empty = get_node("Lower/EnergyBarEmpty")
@onready var node_energy_bar_full = get_node("Lower/EnergyBarFull")

@onready var node_button_gen_upgrade = get_node("Lower/ButtonGenUpgrade")

func _process(delta: float):
    handle_input()
    
    node_text_life.text = "{0}".format([node_player.life])
    node_text_level.text = "Lv.{0}".format([node_player.gen_level])
    node_text_energy.text = "{0}/{1}".format(["%0.1f" % node_player.energy, node_player.energy_max])
    
    node_energy_bar_empty.size.x = node_player.energy_max * 20
    node_energy_bar_full.size.x = node_player.energy * 20
    
    if node_player.gen_level < 5:
        node_text_gen_upgrade.text = "{0}".format([node_player.gen_upgrade])
    else:
        node_text_gen_upgrade.text = "Max"

func handle_input():
    if GlobalVar.state == "":
        if click_state == "":
            if Input.is_action_just_released("mouse_left"):
                var mouse = get_viewport().get_mouse_position()
                if Physics.point_inside_rect(mouse, node_button_gen_upgrade.get_rect()):
                    if node_player.energy > node_player.gen_upgrade and node_player.gen_level < node_player.gen_level_max:
                        node_player.energy -= node_player.gen_upgrade
                        node_player.gen_level += 1
                        node_player.energy_gen += 0.2
                        node_player.energy_max += 2
                        node_player.gen_upgrade += 2
