extends Label

func _process(delta):
    if GVar.tutorial_phase == 'welcome':
        text = GVar.locale['welcome']
    elif GVar.tutorial_phase == 'explain':
        text = GVar.locale['explain']
