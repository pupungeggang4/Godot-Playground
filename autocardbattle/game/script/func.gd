extends Node

func point_inside_rect_ui(point, rect):
    return point.x > rect[0] and point.x < rect[0] + rect[2] and point.y > rect[1] and point.y < rect[1] + rect[3]

func change_scene(prev, path, scene_name):
    prev.queue_free()
    var scene = load(path).instantiate()
    scene.name = scene_name
    get_tree().root.add_child(scene)
