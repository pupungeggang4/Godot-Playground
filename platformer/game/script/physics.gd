extends Node

func detect_fall_on_top(base_rect, entity_rect):
    if entity_rect.position.x > base_rect.position.x - base_rect.size.x / 2 - entity_rect.size.x / 2 and entity_rect.position.x < base_rect.position.x + base_rect.size.x / 2 + entity_rect.size.x / 2 and entity_rect.position.y < base_rect.position.y:
        return base_rect.size.y / 2 + entity_rect.size.y / 2 - (base_rect.position.y - entity_rect.position.y)
    return 0

func detect_from_bottom(base_rect, entity_rect):
    if entity_rect.position.x > base_rect.position.x - base_rect.size.x / 2 - entity_rect.size.x / 2 and entity_rect.position.x < base_rect.position.x + base_rect.size.x / 2 + entity_rect.size.x / 2 and entity_rect.position.y > base_rect.position.y:
        return base_rect.size.y / 2 + entity_rect.size.y / 2 + (base_rect.position.y - entity_rect.position.y)
    return 0
    
func collide_from_left(base_rect, entity_rect):
    if entity_rect.position.y > base_rect.position.y - base_rect.size.y / 2 - entity_rect.size.y / 2 and entity_rect.position.y < base_rect.position.y + base_rect.size.y / 2 + entity_rect.size.y / 2 and entity_rect.position.x < base_rect.position.x:
        return base_rect.size.x / 2 + entity_rect.size.x / 2 - (base_rect.position.x - entity_rect.position.x)
    return 0
    
func collide_from_right(base_rect, entity_rect):
    if entity_rect.position.y > base_rect.position.y - base_rect.size.y / 2 - entity_rect.size.y / 2 and entity_rect.position.y < base_rect.position.y + base_rect.size.y / 2 + entity_rect.size.y / 2 and entity_rect.position.x > base_rect.position.x:
        return base_rect.size.x / 2 + entity_rect.size.x / 2 + (base_rect.position.x - entity_rect.position.x)
    return 0
