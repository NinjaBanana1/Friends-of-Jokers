return {
    descriptions = {
        Joker = {
            --Dave The Diver
             j_foj_norimaki = {
                name = "Norimaki",
                text = {
                    "This {C:attention}Joker{} gives {C:gold}$#1#",
                    "for every scoring card and decreases value",
                    "by {C:gold}-$1{} for every ",
                    "discard/nonscoring card",
                    "{C:inactive}Bank: {C:gold}#2#"
                }
            },
            j_foj_eco_gemstone_bracelet = {
                name = "Eco Gemstone Bracelet",
                text = {
                    "This{C:attention}Joker{} gains {C:blue}+#1# {}Chips",
                    "for {C:attention}Bonus Cards{} or {C:red}+#2# {}Mult",
                    "for {C:attention}Mult Cards{} for played scoring cards",
                    "{C:inactive}Total:{C:blue}+#3#{} Chips, {C:red}+#4#{} Mult"
            }
        },
            --Witcher
            j_foj_witcher1 = {
                name = "Keira Mietz",
                text = {
                    "{C:attention}#1#{} Consumable Slot,",
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
        }
    },
    misc = {
        v_dictionary = {
            foj_consumable_slots_minus = "-#1# Consumable Slots", 
        }
    }
}
