extends Node

func sample(l, n):
    var m = l.duplicate(true)
    var mixed = []
    var rnd = RandomNumberGenerator.new()
    
    while len(m) > 0:
        var index = rnd.randi_range(0, len(m) - 1)
        mixed.append(m.pop_at(index))
        
    return mixed.slice(0, n)
