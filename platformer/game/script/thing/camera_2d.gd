extends Camera2D

@onready var player = get_tree().current_scene.get_node('Level/Player')

func _process(delta: float) -> void:
    position = player.position
