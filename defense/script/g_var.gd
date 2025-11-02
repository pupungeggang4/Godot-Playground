extends Node

var menu = false
var state = ''
var tutorial_phase = 'welcome'

var lang = 0
var locale = Locale.data[Locale.lang_list[lang]]

var adventure = Adventure.new()
var player = AdventurePlayer.new()
