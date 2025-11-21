extends Node2D

@onready var main = get_node('/root/Main')
@export var summon_interval = 1.5
@export var summon_time_left = 1.5

func _process(delta):
    if main.state == '':
        if summon_time_left <= 0:
            var summon = randi() % 2
            var summon_pos = randi() % 4
            var temp_node = null
            if summon == 0:
                temp_node = load('res://scene/ghost.tscn').instantiate()
            else:
                temp_node = load('res://scene/enemy.tscn').instantiate()
            if summon_pos == 0 or summon_pos == 2:
                temp_node.position.y = randi_range(40, 680)
                if summon_pos == 0:
                    temp_node.position.x = -40
                    temp_node.velocity.x = 240
                else:
                    temp_node.position.x = 1320
                    temp_node.velocity.x = -240
            if summon_pos == 1 or summon_pos == 3:
                temp_node.position.x = randi_range(40, 1240)
                if summon_pos == 1:
                    temp_node.position.y = -40
                    temp_node.velocity.y = 240
                else:
                    temp_node.position.y = 760
                    temp_node.velocity.y = -240 
            add_child(temp_node)
            summon_time_left = summon_interval
        else:
            summon_time_left -= delta
