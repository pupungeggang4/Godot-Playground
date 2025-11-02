extends Label

func _process(delta):
    if GVar.tutorial_phase == 'welcome':
        text = GVar.locale['welcome']
    elif GVar.tutorial_phase == 'explain':
        text = GVar.locale['explain']
    elif GVar.tutorial_phase == 'play_card':
        text = GVar.locale['play_card']
