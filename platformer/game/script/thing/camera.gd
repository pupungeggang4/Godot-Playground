extends Camera2D

var node_player

func _ready():
    node_player = get_node('/root/Game/Player')

func _process(delta):
    position.x = node_player.position.x
    position.y = node_player.position.y
