return {
    descriptions = {
        Joker = {
            --Dave The Diver
            j_foj_norimaki = {
                name = "Norimaki",
                text = {
                    "This {C:attention}Joker{} gives {C:gold}$#1#",
                    "for every scoring card and decreases value",
                    "by {C:gold}$1{} for every ",
                    "by {C:gold}$1{} for every ",
                    "discard/nonscoring card",
                    "{C:inactive}Bank: {C:gold}#2#"
                }
            },
            j_foj_eco_gemstone_bracelet = {
                name = "Eco Gemstone Bracelet",
                text = {
                    "This {C:attention}Joker{} gains {C:blue}+#1# {}Chips",
                    "when a {C:attention}Bonus Card{} scores and {C:red}+#2# {}Mult",
                    "when a {C:attention}Mult Card{} scores",
                    "{C:inactive}(Currently {C:blue}+#3#{C:inactive} Chips and {C:red}+#4#{C:inactive} Mult)"
                }
            },
            j_foj_clownfish_sushi = {
                name = "Clownfish Sushi",
                text = {
                    "Any Joker in Shop becomes {C:dark_edition}Negative",
                    "Uses: {c:attention}#1#"
                }
        },
            --Witcher
            j_foj_witcher1 = {
                name = "Keira Mietz",
                text = {
                    "{C:attention}-#1#{} Consumable Slot,",
                    "{C:attention}-#1#{} Consumable Slot,",
                    "creates a copy of {C:attention}The Fool{}",
                    "when Blind is selected",
                    "{C:inactive}(Must have room)"
                }
            },
            j_foj_witcher2 = {
                name = "King of Beggars",
                text = {
                    "While {C:attention}in a Blind{}, earn",
                    "{C:money}$#1#{} when a card is {C:attention}sold{}"
                }
            },
            j_foj_witcher3 = {
                name = "Casimir Bassi",
                text = {
                    "When obtained, {C:attention}set money to $0{}",
                    "and gain {C:chips}+#1#{} Chips",
                    "for every {C:money}$1{} removed",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} chips)"
                }
        },
            --Among Us
            j_foj_amongus1 = {
                name = "Impostor",
                text = {
                    "Sell this card to destroy all selected cards"
                }
            },
            j_foj_amongus2 = {
                name = "Shapeshifter",
                text = {
                    "Copies ability of",
                    "{C:attention}Joker{} to the left",
                    "{C:green}#1# in #2#{} chance to",
                    "destroy Joker instead"
                }
            },
             j_foj_amongus3 = {
                name = "Emergency Button",
                text = {
                    "Sell this card to immediately win the Blind"
                }
        },
            --Cyberpunk 2077
            j_foj_cyberpunk3 = {
                name = "Sandevistan",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "when a Blind is {C:attention}skipped{}, resets",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
        },
            --[[TEMPLATE
            j_foj_template1 = {
                name = "TEMPLATE",
                text = {
                    "TEMPLATE",
                    "TEMPLATE",
                    "TEMPLATE"
                }
            },
            j_foj_template2 = {
                name = "TEMPLATE",
                text = {
                    "TEMPLATE",
                    "TEMPLATE",
                    "TEMPLATE"
                }
            },
            j_foj_template3 = {
                name = "TEMPLATE",
                text = {
                    "TEMPLATE",
                    "TEMPLATE",
                    "TEMPLATE"
                }
        }, --]]
        }
    },
    misc = {
        v_dictionary = {
            foj_consumable_slots_minus = "-#1# Consumable Slots", 
        }
    }
}
