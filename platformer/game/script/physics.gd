extends Node

func detect_fall_on_top(base, fall):
    if fall.position.x > base.position.x - base.size.x / 2 - fall.size.x / 2 and fall.position.x < base.position.x + base.size.x / 2 + fall.size.x / 2 and fall.position.y < base.position.y:
        return base.size.y / 2 + fall.size.y / 2 - (base.position.y - fall.position.y)
    return 0
