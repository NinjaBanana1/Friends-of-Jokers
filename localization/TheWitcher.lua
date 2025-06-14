-- Keira Mietz
SMODS.Joker {
    key = "witcher1",
    config = { extra = { consumable_slot_mod = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.consumable_slot_mod } }
    end,
    rarity = 1,
    atlas = "Placeholders",
    pos = { x = 0, y = 0 },
    cost = 5,
    calculate = function(self, card, context)
        if
            context.setting_blind and not (context.blueprint_card or self).getting_sliced
            and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
        then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, "c_fool", "tarot")
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            -- Avoiding conflicts with cartomancer
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil,
                        { message = localize('k_plus_tarot'), colour = G.C.PURPLE })
                    return true
                end
            }))
        end
    end,
    add_to_deck = function(self, card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.consumable_slot_mod
        card_eval_status_text(card, "jokers", nil, nil, nil,
            { message = localize { type = "variable", key = "foj_consumable_slots_minus", vars = { card.ability.extra.consumable_slot_mod } },
            colour = G.C.DARK_EDITION })
    end,
    remove_from_deck = function(self, card)
        G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.consumable_slot_mod
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
}

-- King of Beggars
SMODS.Joker {
    key = "witcher2",
    config = { extra = { dollars = 8 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    rarity = 2,
    atlas = "Placeholders",
    pos = { x = 1, y = 0 },
    cost = 6,
    calculate = function(self, card, context)
        if G.GAME.blind.in_blind and context.selling_card then
            ease_dollars(card.ability.extra.dollars)
            card_eval_status_text(card, "dollars", 8)
        end
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
}

-- Casimir Bassi
SMODS.Joker {
    key = "witcher3",
    config = { extra = { chips_gained = 10, current_chips = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips_gained, card.ability.extra.current_chips } }
    end,
    rarity = 3,
    atlas = "Placeholders",
    pos = { x = 2, y = 0 },
    cost = 7,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chip_mod = card.ability.extra.current_chips,
                message = localize { variable = "variable", key = "a_chips", vars = card.ability.extra.current_chips }
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            local dollars = G.GAME.dollars
            ease_dollars(-dollars, true)
            card.ability.extra.current_chips = dollars * card.ability.extra.chips_gained
            card_eval_status_text(card, "chips", card.ability.extra.current_chips)
        end
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
}
