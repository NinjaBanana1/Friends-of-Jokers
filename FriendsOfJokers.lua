FOJ = {}

SMODS.load_file("lib/define.lua")() -- Definitions 
SMODS.load_file("lib/utility.lua")() -- Utils

SMODS.Atlas {
    key = "Placeholders",
    path = "placeholders.png",
    px = 71,
    py = 95
}

-- Load jokers
FOJ.register_items(FOJ.JOKER_SET_1_2, "Jokers/Set1+2")
--FOJ.register_items(FOJ.JOKER_SET_1_2, "Jokers/Set3")
--FOJ.register_items(FOJ.JOKER_SET_1_2, "Jokers/Set4")


