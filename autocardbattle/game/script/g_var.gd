extends Node

var state = ''
var menu = false

var selected_character = -1

var adventure = {
    'layout': [
        ['battle', 'battle', 'battle'],
        ['shop', 'shop', 'shop'],
        ['battle', 'battle', 'battle'],
        ['shop', 'shop', 'shop'],
        ['battle', 'elite', 'battle'],
        ['shop', 'shop', 'shop'],
        ['boss', 'boss', 'boss']
    ],
    'round': 0,
}

var player = {
    'hp': 0,
    'deck': [],
    'deck_crystal': [],
    'equipment': [],
    'gold': 0,
}

var collection_tab = 0
