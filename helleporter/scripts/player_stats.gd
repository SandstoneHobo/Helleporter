extends Node

#player stats
var max_health := 15
var cur_health := 10
var move_speed := 150.0
var attack_damage := 5
var helleport_damage := 10

#stats for play exp system
var cur_level = 1
var exp_thresholds = {"2": 10, "3": 15, "4": 20, "5": 25, "6": 30, "7":35}

#upgrade stats
var sword_influence = 0
var helleport_influence = 0
var demonic_influence = 0
