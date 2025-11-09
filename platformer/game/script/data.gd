extends Node

func load_level(level, path):
    var entity = level.get_node('Entity')
    var player = level.get_node('Player')
    var file = FileAccess.open(path, FileAccess.READ)
    var parsed = JSON.parse_string(file.get_as_text())
    player.position = Vector2(parsed['start_pos'][0], parsed['start_pos'][1])
    player.rect.position = Vector2(parsed['start_pos'][0], parsed['start_pos'][1])

    for i in range(len(parsed['entity'])):
        if parsed['entity'][i][0] == 'wall':
            var tmp = load('res://scene/thing/wall.tscn').instantiate()
            tmp.rect = Rect2(parsed['entity'][i][1][0], parsed['entity'][i][1][1], parsed['entity'][i][1][2], parsed['entity'][i][1][3])
            entity.add_child(tmp)
            
        if parsed['entity'][i][0] == 'belt':
            var tmp = load('res://scene/thing/belt.tscn').instantiate()
            tmp.rect = Rect2(parsed['entity'][i][1][0], parsed['entity'][i][1][1], parsed['entity'][i][1][2], parsed['entity'][i][1][3])
            entity.add_child(tmp)
            
        if parsed['entity'][i][0] == 'coin':
            var tmp = load('res://scene/thing/coin.tscn').instantiate()
            tmp.position = Vector2(parsed['entity'][i][1][0], parsed['entity'][i][1][1])
            entity.add_child(tmp)
