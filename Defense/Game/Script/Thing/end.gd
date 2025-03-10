extends Node2D

@onready var node_unit = get_tree().current_scene.get_node("Field/Unit")
@onready var node_player = get_tree().current_scene.get_node("Player")

func _process(delta: float):
    handle_enemy()

func handle_enemy():
    for unit in node_unit.get_children():
        if (position - unit.position).length() < 5:
            if unit.side == 1:
                unit.queue_free()
                node_player.life -= 1
                
                if node_player.life <= 0:
                    GlobalVar.state = "game_over"
