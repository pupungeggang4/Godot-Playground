extends Node

func point_inside_rect_ui(pos, rect):
    return pos[0] > rect[0] and pos[0] < rect[0] + rect[2] and pos[1] > rect[1] and pos[1] < rect[1] + rect[3]

func change_scene(curr, path, new_name):
    var new_scene = load(path).instantiate()
    new_scene.name = new_name
    get_tree().root.add_child(new_scene)
    curr.queue_free()
