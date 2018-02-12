-- default (Minetest 0.4 mod)
-- Most default stuff

-- The API documentation in here was moved into doc/lua_api.txt

WATER_ALPHA = 160
WATER_VISC = 1
LAVA_VISC = 7
LIGHT_MAX = 14

-- Definitions made by this mod that other mods can use too
ninjastarmod = {}


-- Set a noticeable inventory formspec for players
minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		minetest.chat_send_player(player:get_player_name(), "NinjaStarMod  made by: jtrent238")
	end
	minetest.after(2.0, cb, player)
end)

function ninjastarmod.spawn_ninjastar(pos, start, player)
	if ninjastarmod.is_ninjastar(star)	then
		return minetest.add_entity(pos, star.."_entity")
	elseif minetest.registered_items[star].throwing_entity then
		if type(minetest.registered_items[star].throwing_entity) == string then
			return minetest.add_entity(pos, minetest.registered_items[star].throwing_entity)
		else -- Type is a function
			return minetest.registered_items[star].throwing_entity(pos, player)
		end
	else
		obj = minetest.add_entity(pos, "_builtin:item", star)
	end
end

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
