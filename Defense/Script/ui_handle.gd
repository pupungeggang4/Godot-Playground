extends CanvasLayer

@onready var node_player = get_node("../Player")
@onready var node_text_energy = get_node('Energy')

func _process(delta: float):
    node_text_energy.text = "{0}/{1}".format(["%0.1f" % node_player.energy, node_player.energy_max])
