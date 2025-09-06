extends Node

func point_inside_rect_ui(pos, rect):
    return pos[0] > rect[0] and pos[0] < rect[0] + rect[2] and pos[1] > rect[1] and pos[1] < rect[1] + rect[3]

func change_scene_to(prev, path, scene_name):
    var scene = load(path).instantiate()
    scene.name = scene_name
    get_tree().root.add_child(scene)
    prev.queue_free()
