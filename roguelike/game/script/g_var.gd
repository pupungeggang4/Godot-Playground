extends Node

var state = ''
var menu = false
var lang = 0
var locale = Locale.data[Locale.lang_list[lang]]

var selected_title = 0
var selected_menu_village = 0
var selected_menu_battle = 0
var selected_adventure_confirm = 0
var selected_adventure_start = 0

var selected_reward = 0

var adventure = Adventure.new()
