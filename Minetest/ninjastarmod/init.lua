--This mod was made with the help of throwing mod : https://github.com/minetest-mods/throwing

-- Definitions made by this mod that other mods can use too
ninjastarmod = {}

ninjastarmod.stars = {"ItemNinjaStar_wood", "ItemNinjaStar_stone", "ItemNinjaStar_iron", "ItemNinjaStar_gold", "ItemNinjaStar_mese", "ItemNinjaStar_diamond"}

ninjastarmod.target_object = 1
ninjastarmod.target_node = 2
ninjastarmod.target_both = 3

ninjastarmod.modname = minetest.get_current_modname()

-- Set a noticeable inventory formspec for players
minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		minetest.chat_send_player(player:get_player_name(), "NinjaStarMod  made by: jtrent238")
	end
	minetest.after(2.0, cb, player)
end)

function ninjastarmod.is_star(itemstack)
	for _, arrow in ipairs(ninjastarmod.stars) do
		if (type(itemstack) == "string" and itemstack or itemstack:get_name()) == star then
			return true
		end
	end
	return false
end

local function throw_star(itemstack, player, index, throw_itself, new_stack)
	local inventory = player:get_inventory()
	if not throw_itself then
		if index >= player:get_inventory():get_size("main") then
			return false
		end
		index = index + 1
	end
	local star_stack = inventory:get_stack("main", index)
	local star = star_stack:get_name()
	
	local playerpos = player:getpos()
	local pos = {x=playerpos.x,y=playerpos.y+1.5,z=playerpos.z}
	local obj = (minetest.registered_items[itemstack:get_name()].spawn_ninjastar or ninjastarmod.spawn_ninjastar)(pos, arrow, player)
	
	local luanetity = obj:get_luaentity()
	luanetity.player = player:get_player_name()
	if not luanetity.item then
		luanetity.item = star
	end
	
	if luanetity.on_throw then
		if luanetity:on_throw(pos, player, star_stack, index, luanetity.data) == false then
			obj:remove()
			return false
		end
	end
	
	local dir = player:get_look_dir()
	local velocity_factor = tonumber(minetest.settings:get("ninjastarmod.velocity_factor")) or 19
	local horizontal_acceleration_factor = tonumber(minetest.settings:get("ninjastarmod.horizontal_acceleration_factor")) or -3
	local vertical_acceleration = tonumber(minetest.settings:get("ninjastarmod.vertical_acceleration")) or -10
	
	obj:setvelocity({x=dir.x*velocity_factor, y=dir.y*velocity_factor, z=dir.z*velocity_factor})
	obj:setacceleration({x=dir.x*horizontal_acceleration_factor, y=vertical_acceleration, z=dir.z*horizontal_acceleration_factor})
	obj:setyaw(player:get_look_horizontal()-math.pi/2)
	
	if luanetity.on_throw_sound ~= "" then
		minetest.sound_play(luanetity.on_throw_sound or "NinjaStarHit", {pos=playerpos, gain = 0.5})
	end
	
	if not minetest.settings:get_bool("creative_mode") then
		if new_stack then
			inventory:set_stack("main", index, new_stack)
		else
			local stack = inventory:get_stack("main", index)
			stack:take_item()
			inventory:set_stack("main", index, stack)
		end
	end
	
	return true

end
	
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
