extends Label

@export var time = 0

func _ready():
    time = 0
    
func _process(delta):
    time += delta
    var m = int(time / 60)
    var s = int(time) % 60
    var text_min = ''
    var text_sec = ''
    if m < 10:
        text_min = '0' + str(m)
    else:
        text_min = str(m)
        
    if s < 10:
        text_sec = '0' + str(s)
    else:
        text_sec = str(s)

    text = text_min + ':' +  text_sec
