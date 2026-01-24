--[[
--Norimaki
-- Works, but could use improvements
-- no delay between scoring and giving cash
-- no indicator on the card when it activates in any case
-- doesn't reduce bank for nonscoring cards (banana)
SMODS.Joker {
    key = 'norimaki',
    config = {
        extra = {
            withdraw = 1,
            bank = 20,
        }
    },
    atlas = 'Placeholders',
    pos = {
        x = 0,
        y = 0
    }, 
    rarity = 1,
    cost = 4,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.withdraw,
          card.ability.extra.bank,
        }
      }
    end,
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
        ease_dollars(1)
        card.ability.extra.bank = card.ability.extra.bank - card.ability.extra.withdraw
      end
      if context.discard then
        card.ability.extra.bank = card.ability.extra.bank - card.ability.extra.withdraw
      end
    end
}
]]--

--Eco Bracelet
SMODS.Joker {
    key = "davethediver2",
    atlas = "Placeholders",
    pos = { x = 1, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    cost = 7,
    rarity = 2,
    config = { extra = { chips_gain = 5, chips = 0, mult_gain = 1, mult = 0 }, },
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
      info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        return { vars = { card.ability.extra.chips_gain, card.ability.extra.chips, card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_bonus') then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips_gain } },
                colour = G.C.BLUE,
                delay = 0.45
            }
          end
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_mult') then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_gain } },
                colour = G.C.RED,
                delay = 0.45
            }
          end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
}

--[[
--Clownfish Sushi
-- Doesn't seem to function? (banana)
SMODS.Joker {
    key = 'clownfish_sushi',
    config = {
        extra = {
            uses = 5
        }
    },
    atlas = 'Placeholders',
    pos = {
        x = 2,
        y = 0
    }, 
    rarity = 2,
    cost = 6,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.uses,
        }
      }
    end,
    calculate = function(self, card, context)
      if context.type == "store_joker_create"  and  card.ability.extra.uses ~= 0 then
        card.ability.extra.uses = card.ability.extra.uses - 1
        G.E_MANAGER:add_event(Event({
          func = function()
          local card = create_card("Joker", context.area, nil, nil, nil, nil, 'j_')          
          create_shop_card_ui(card, "Joker", context.area)
          card.states.visible = false
          card:start_materialize()
          card:set_edition({negative = true})
			  return true
        end}))
      end
    end
}

    end
}
]]--