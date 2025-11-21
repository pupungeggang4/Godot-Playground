extends Label

@onready var main = get_node('/root/Main')

func _ready():
    text = ''
    
func _process(delta):
    if main.state == 'game_over':
        text = 'Game over!'
