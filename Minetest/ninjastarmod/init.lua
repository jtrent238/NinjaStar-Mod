-- ninjastarmod (ninjastarmod 1.0.0.0)
-- Made by: jtrent238

-- Definitions made by this mod that other mods can use too
ninjastarmod = {}
ninjastarmod.modname = minetest.get_current_modname()

-- Load other files
--dofile(minetest.get_modpath("ninjastarmod").."/EntityNinjaStar_wood.lua")
--dofile(minetest.get_modpath("ninjastarmod").."/ItemNinjaStar_stone.lua")
--dofile(minetest.get_modpath("ninjastarmod").."/ItemNinjaStar_iron.lua")
--dofile(minetest.get_modpath("ninjastarmod").."/ItemNinjaStar_gold.lua")
--dofile(minetest.get_modpath("ninjastarmod").."/ItemNinjaStar_mese.lua")
--dofile(minetest.get_modpath("ninjastarmod").."/ItemNinjaStar_diamond.lua")

-- Set a noticeable inventory formspec for players
minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		minetest.chat_send_player(player:get_player_name(), "NinjaStarMod  made by: jtrent238")
	end
	minetest.after(2.0, cb, player)
end)

-- Add NinjaStars to treasurer API
if minetest.get_modpath("treasurer") then
	treasurer.register_treasure("ninjastarmod:ItemNinjaStar_wood",0.1,2,{3,6})
	treasurer.register_treasure("ninjastarmod:ItemNinjaStar_stone",0.1,2,{3,6})
	treasurer.register_treasure("ninjastarmod:ItemNinjaStar_iron",0.1,2,{3,6})
	treasurer.register_treasure("ninjastarmod:ItemNinjaStar_gold",0.1,2,{3,6})
	treasurer.register_treasure("ninjastarmod:ItemNinjaStar_mese",0.1,2,{3,6})
	treasurer.register_treasure("ninjastarmod:ItemNinjaStar_diamond",0.1,2,{3,6})
end



-- ITEMS

minetest.register_craftitem('ninjastarmod:ItemNinjaStar_wood', {
    description = 'Wooden Ninja Star',
    inventory_image = 'ItemNinjaStar_wood.png',
    stack_max = 64,
})

minetest.register_entity(":__builtin:item", EntityNinjaStar)

minetest.register_craftitem('ninjastarmod:ItemNinjaStar_stone', {
    description = 'Stone Ninja Star',
    inventory_image = 'ItemNinjaStar_stone.png',
    stack_max = 64,
})

minetest.register_craftitem('ninjastarmod:ItemNinjaStar_iron', {
    description = 'Iron Ninja Star',
    inventory_image = 'ItemNinjaStar_iron.png',
    stack_max = 64,
})

minetest.register_craftitem('ninjastarmod:ItemNinjaStar_gold', {
    description = 'Golden Ninja Star',
    inventory_image = 'ItemNinjaStar_gold.png',
    stack_max = 64,
})

minetest.register_craftitem('ninjastarmod:ItemNinjaStar_diamond', {
    description = 'Diamond Ninja Star',
    inventory_image = 'ItemNinjaStar_diamond.png',
    stack_max = 64,
})

minetest.register_craftitem('ninjastarmod:ItemNinjaStar_mese', {
    description = 'Mese Ninja Star',
    inventory_image = 'ItemNinjaStar_mese.png',
    stack_max = 64,
})

-- CRAFTS

minetest.register_craft({
    output = 'ninjastarmod:ItemNinjaStar_wood',
    recipe = {
      {'','default:acacia_wood',''},
      {'default:acacia_wood', '', 'default:acacia_wood'},
      {'', 'default:acacia_wood', ''},
    }
})

minetest.register_craft({
    output = 'ninjastarmod:ItemNinjaStar_wood',
    recipe = {
      {'','default:aspen_wood',''},
      {'default:aspen_wood', '', 'default:aspen_wood'},
      {'', 'default:aspen_wood', ''},
    }
})

minetest.register_craft({
    output = 'ninjastarmod:ItemNinjaStar_wood',
    recipe = {
      {'','default:pine_wood',''},
      {'default:pine_wood', '', 'default:pine_wood'},
      {'', 'default:pine_wood', ''},
    }
})

minetest.register_craft({
    output = 'ninjastarmod:ItemNinjaStar_wood',
    recipe = {
      {'','default:wood',''},
      {'default:wood', '', 'default:wood'},
      {'', 'default:wood', ''},
    }
})

minetest.register_craft({
    output = 'ninjastarmod:ItemNinjaStar_stone',
    recipe = {
      {'','default:stone',''},
      {'default:stone', '', 'default:stone'},
      {'', 'default:stone', ''},
    }
})

minetest.register_craft({
    output = 'ninjastarmod:ItemNinjaStar_iron',
    recipe = {
      {'','default:ingot_iron',''},
      {'default:ingot_iron', '', 'default:ingot_lump'},
      {'', 'default:ingot_iron', ''},
    }
})

minetest.register_craft({
    output = 'ninjastarmod:ItemNinjaStar_iron',
    recipe = {
      {'','default:iron_lump',''},
      {'default:iron_lump', '', 'default:iron_lump'},
      {'', 'default:iron_lump', ''},
    }
})

minetest.register_craft({
    output = 'ninjastarmod:ItemNinjaStar_gold',
    recipe = {
      {'','default:gold_ingot',''},
      {'default:gold_ingot', '', 'default:gold_ingot'},
      {'', 'default:gold_ingot', ''},
    }
})

minetest.register_craft({
    output = 'ninjastarmod:ItemNinjaStar_mese',
    recipe = {
      {'','default:mese_crystal',''},
      {'default:mese_crystal', '', 'default:mese_crystal'},
      {'', 'default:mese_crystal', ''},
    }
})

minetest.register_craft({
    output = 'ninjastarmod:ItemNinjaStar_diamond',
    recipe = {
      {'','default:diamond',''},
      {'default:diamond', '', 'default:diamond'},
      {'', 'default:diamond', ''},
    }
})