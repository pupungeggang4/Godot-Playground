extends Label

@onready var main = get_node('/root/Main')
@export var score = 0

func _ready():
    score = 0
    text = str(score)
    
func _process(delta):
    if main.state == '':
        score += delta
        text = '%.1f' % [score]
