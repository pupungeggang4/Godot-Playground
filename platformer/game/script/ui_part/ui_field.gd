extends Control

@onready var player = get_node('/root/Field/Level/Player')
@onready var text_coin = get_node('TextCoin')

func _process(delta):
    text_coin.text = '%d' % [player.coin]
