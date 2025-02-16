extends Node

var selected_character = "Crimson"
#var username = ""
var current_level = 1
var higher_level_completed = 0
var Coins = 0
var CoinsEd = 0
#CoinsEd significa o valor de moedas ganhadas no final da fase
var TimeL = 0

var unlocked_characters = []
var characters = {
	"Crimson": "res://actors/Char_Hood.tscn",
	"Hickory": "res://actors/Char_Florest.tscn"
}

var character_levels = {
	"Crimson": 1,
	"Hickory": 1,
}
