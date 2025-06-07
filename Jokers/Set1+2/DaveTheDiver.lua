--Norimaki
SMODS.Joker {
    key = 'norimaki',
    config = {
        extra = {
            withdraw = 1,
            bank = 20,
        }
    },
    atlas = 'joker',
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

--Eco Gemstone Bracelet
SMODS.Joker {
    key = 'eco_gemstone_bracelet',
    config = {
        extra = {
            chips = 5,
            mult = 1,
            chip_total = 0,
            mult_total = 0
        }
    },
    atlas = 'joker',
    pos = {
        x = 0,
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
          card.ability.extra.chips,
          card.ability.extra.mult,
        }
      }
    end,
    calculate = function(self, card, context)
     if context.joker_main then
        for _, v in ipairs(G.play.cards) do
          if SMODS.has_enhancement('m_bonus') then
            return {
              chip_total = card.ability.extra.chips + card.ability.extra.chip_total
            }
          end
           if SMODS.has_enhancement('m_mult') then
            return {
              mult_total = card.ability.extra.mult + card.ability.extra.mult_total
            }
          end
        end
     end
     end
}

--Clownfish Sushi
SMODS.Joker {
    key = 'clownfish_sushi',
    config = {
        extra = {
            uses = 5
        }
    },
    atlas = 'joker',
    pos = {
        x = 0,
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
