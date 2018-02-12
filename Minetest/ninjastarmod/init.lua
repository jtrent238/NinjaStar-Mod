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

-- THROWABLES

throwing.register_arrow("ninjastarmod:ItemNinjaStar_wood", {
	itemcraft = "ninjastarmod:ItemNinjaStar_wood",
	craft_quantity = 16,
	description = "ItemNinjaStar_wood",
	tiles = {"ItemNinjaStar_wood.png"},
	target = throwing.target_object,
	on_hit_sound = "NinjaStarHit",
	on_hit = function(pos, _, _, object, hitter)
		object:punch(hitter, 1, {
			full_punch_interval = 1,
			damage_groups = {fleshy = 3}
		})
	end
})

throwing.register_arrow("ninjastarmod:ItemNinjaStar_stone", {
	itemcraft = "ninjastarmod:ItemNinjaStar_stone",
	craft_quantity = 16,
	description = "ItemNinjaStar_stone",
	tiles = {"ItemNinjaStar_stone.png"},
	target = throwing.target_object,
	on_hit_sound = "NinjaStarHit",
	on_hit = function(pos, _, _, object, hitter)
		object:punch(hitter, 1, {
			full_punch_interval = 1,
			damage_groups = {fleshy = 3}
		})
	end
})

throwing.register_arrow("ninjastarmod:ItemNinjaStar_iron", {
	itemcraft = "ninjastarmod:ItemNinjaStar_iron",
	craft_quantity = 16,
	description = "ItemNinjaStar_iron",
	tiles = {"ItemNinjaStar_iron.png"},
	target = throwing.target_object,
	on_hit_sound = "NinjaStarHit",
	on_hit = function(pos, _, _, object, hitter)
		object:punch(hitter, 1, {
			full_punch_interval = 1,
			damage_groups = {fleshy = 3}
		})
	end
})

throwing.register_arrow("ninjastarmod:ItemNinjaStar_gold", {
	itemcraft = "ninjastarmod:ItemNinjaStar_gold",
	craft_quantity = 16,
	description = "ItemNinjaStar_gold",
	tiles = {"ItemNinjaStar_mese.png"},
	target = throwing.target_object,
	on_hit_sound = "NinjaStarHit",
	on_hit = function(pos, _, _, object, hitter)
		object:punch(hitter, 1, {
			full_punch_interval = 1,
			damage_groups = {fleshy = 3}
		})
	end
})

throwing.register_arrow("ninjastarmod:ItemNinjaStar_mese", {
	itemcraft = "ninjastarmod:ItemNinjaStar_mese",
	craft_quantity = 16,
	description = "ItemNinjaStar_mese",
	tiles = {"ItemNinjaStar_mese.png"},
	target = throwing.target_object,
	on_hit_sound = "NinjaStarHit",
	on_hit = function(pos, _, _, object, hitter)
		object:punch(hitter, 1, {
			full_punch_interval = 1,
			damage_groups = {fleshy = 3}
		})
	end
})

throwing.register_arrow("ninjastarmod:ItemNinjaStar_diamond", {
	itemcraft = "ninjastarmod:ItemNinjaStar_diamond",
	craft_quantity = 16,
	description = "ItemNinjaStar_diamond",
	tiles = {"ItemNinjaStar_diamond.png"},
	target = throwing.target_object,
	on_hit_sound = "NinjaStarHit",
	on_hit = function(pos, _, _, object, hitter)
		object:punch(hitter, 1, {
			full_punch_interval = 1,
			damage_groups = {fleshy = 3}
		})
	end
})

