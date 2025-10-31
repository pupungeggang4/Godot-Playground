extends Node2D

var level = 1
var energy = 0
var energy_max = 6
var energy_gen = 1
var life = 20

func _process(delta):
    print(GVar.state)
    if GVar.menu == false:
        if GVar.state == '':
            handle_lose()
            energy_restore(delta)
            
func start_battle():
    level = 1; energy = 3; energy_gen = 1; energy_max = 6; life = 20
            
func energy_restore(delta):
    energy += energy_gen * delta
    if energy >= energy_max:
        energy = energy_max
    
func handle_lose():
    if life <= 0:
        GVar.state = 'lose'
