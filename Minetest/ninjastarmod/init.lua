-- default (Minetest 0.4 mod)
-- Most default stuff

-- The API documentation in here was moved into doc/lua_api.txt

WATER_ALPHA = 160
WATER_VISC = 1
LAVA_VISC = 7
LIGHT_MAX = 14

-- Definitions made by this mod that other mods can use too
default = {}


-- Set a noticeable inventory formspec for players
minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		minetest.chat_send_player(player:get_player_name(), "NinjaStarMod  made by: jtrent238")
	end
	minetest.after(2.0, cb, player)
end)


-- ITEMS

minetest.register_craftitem('ninjastarmod:ItemNinjaStar_wood', {
    description = 'Wooden Ninja Star',
    inventory_image = 'ItemNinjaStar_wood.png',
    stack_max = 64,
})

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
    output = 'hammermod:ItemCopperHammer',
    recipe = {
      {'default:copper_ingot','default:copper_ingot','default:copper_ingot'},
      {'default:copper_ingot', 'group:stick', 'default:copper_ingot'},
      {'', 'group:stick', ''},
    }
})

minetest.register_craft({
    output = 'hammermod:ItemIronHammer',
    recipe = {
      {'default:iron_lump','default:iron_lump','default:iron_lump'},
      {'default:iron_lump', 'group:stick', 'default:iron_lump'},
      {'', 'group:stick', ''},
    }
})

minetest.register_craft({
    output = 'hammermod:ItemSteelHammer',
    recipe = {
      {'default:steel_ingot','default:steel_ingot','default:steel_ingot'},
      {'default:steel_ingot', 'group:stick', 'default:steel_ingot'},
      {'', 'group:stick', ''},
    }
})

minetest.register_craft({
    output = 'hammermod:ItemBronzeHammer',
    recipe = {
      {'default:bronze_ingot','default:bronze_ingot','default:bronze_ingot'},
      {'default:bronze_ingot', 'group:stick', 'default:bronze_ingot'},
      {'', 'group:stick', ''},
    }
})
