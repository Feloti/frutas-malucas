extends Node

var selected_character = 1
var username = ""
var current_level = 1
var higher_level_completed = 0
var Coins = 0
var CoinsEd = 0
#CoinsEd significa o valor de moedas ganhadas no final da fase
var TimeL = 0

var characters = {
	1: "res://actors/Char_Hood.tscn",
	2: "res://actors/Char_Florest.tscn"
}
