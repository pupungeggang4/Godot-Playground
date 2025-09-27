extends Node

const card = {
    1: {'ID': 1, 'name': 'plain 1', 'type': 'unit', 'element': 'normal', 'crystal': [['any', 1]], 'stat': [1, 2]},
    2: {'ID': 1, 'name': 'plain 2', 'type': 'unit', 'element': 'normal', 'crystal': [['any', 2]], 'stat': [2, 3]},
    3: {'ID': 1, 'name': 'plain 3', 'type': 'unit', 'element': 'normal', 'crystal': [['any', 3]], 'stat': [3, 4]}
}

const card_e = {
    1: [],
    2: [],
    3: []
}

const card_d = {
    1: '',
    2: '',
    3: ''
}

const crystal = {
    1: {'ID': 1, 'name': 'normal crystal', 'element': 'normal', 'effect': []},
    2: {'ID': 2, 'name': 'fire crystal', 'element': 'fire', 'effect': []},
    3: {'ID': 3, 'name': 'water crystal', 'element': 'water', 'effect': []},
    4: {'ID': 4, 'name': 'wind crystal', 'element': 'wind', 'effect': []},
    5: {'ID': 5, 'name': 'earth crystal', 'element': 'earth', 'effect': []},
    6: {'ID': 6, 'name': 'light crystal', 'element': 'light', 'effect': []},
    7: {'ID': 7, 'name': 'dark crystal', 'element': 'dark', 'effect': []},
    8: {'ID': 8, 'name': 'rainbow crystal', 'element': 'all', 'effect': []},
}

const crystal_d = {
    1: '',
    2: '',
    3: '',
    4: '',
    5: '',
    6: '',
    7: '',
    8: ''
}

const character = {
    1: {'deck': [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], 'crystal': [1, 1, 1, 1, 2, 2, 2, 2]},
    2: {'deck': [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], 'crystal': [1, 1, 1, 1, 3, 3, 3, 3]},
    3: {'deck': [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], 'crystal': [1, 1, 1, 1, 4, 4, 4, 4]},
    4: {'deck': [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], 'crystal': [1, 1, 1, 1, 5, 5, 5, 5]},
    5: {'deck': [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], 'crystal': [1, 1, 1, 1, 6, 6, 6, 6]},
    6: {'deck': [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], 'crystal': [1, 1, 1, 1, 7, 7, 7, 7]},
    7: {'deck': [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], 'crystal': [1, 1, 1, 1, 1, 1, 8, 8]},
}

const character_d = {
    1: 'Character : Fire\nGain extra energy.',
    2: 'Character : Water\nSummon units.',
    3: 'Character : Wind\nPlay extra card.',
    4: 'Character : Earth\nGain armor.',
    5: 'Character : Light\nHeal units.',
    6: 'Character : Dark\nPlay powerful cards.',
    7: 'Character : All\n Use all cards.'
}

const enemy = {
    1: {'deck': [1, 1, 1, 1, 1, 1, 1, 1], 'crystal': [1, 1, 1, 1, 1, 1, 1, 1], 'hp': 15}
}
