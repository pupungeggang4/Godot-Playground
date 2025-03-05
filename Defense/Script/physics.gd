extends Node

func point_inside_rect(point, rect):
    return point.x > rect.position.x and point.x < rect.position.x + rect.size.x and point.y > rect.position.y and point.y < rect.position.y + rect.size.y
