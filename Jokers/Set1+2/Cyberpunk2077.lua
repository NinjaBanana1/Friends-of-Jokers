--Headhunter
SMODS.Joker {
    key = "cyberpunk2",
    atlas = "Placeholders",
    pos = { x = 1, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    cost = 6,
    rarity = 2,
    config = { extra = { xmult = 1, xmult_active = 3 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_active } }
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards and G.GAME.blind.in_blind then
            card.ability.extra.xmult = card.ability.extra.xmult_active
            return {
                message = localize('k_active_ex')
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.xmult > 1 then
                card.ability.extra.xmult = 1
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
SMODS.Joker {
    key = "cyberpunk3",
    atlas = "Placeholders",
    pos = { x = 2, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    cost = 8,
    rarity = 3,
    config = { extra = { xmult_gain = 2, xmult = 1 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.skip_blind then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                message = localize('k_upgrade_ex')
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if context.beat_boss and card.ability.extra.xmult > 1 then
                card.ability.extra.xmult = 1
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}