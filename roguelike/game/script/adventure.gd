extends Node

class_name Adventure

var layout = [
    ['rest', 'rest', 'rest'],
    ['battle', 'battle', 'battle'],
    ['battle', 'shop', 'event'],
    ['battle', 'battle', 'battle'],
    ['battle', 'shop', 'event'],
    ['boss', 'boss', 'boss']
]

var floor = 0

func start_adventure():
    floor = 0
