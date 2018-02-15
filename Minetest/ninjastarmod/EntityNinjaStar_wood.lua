-- I want to give credit to: Splizard for their minetest-mod-snow https://github.com/Splizard/minetest-mod-snow/blob/master/src/snowball.lua
-- Thank you!

local creative_mode = minetest.settings:get_bool"creative_mode"


local ninjastar_velocity, entity_attack_delay
local function update_ninjastar_vel(v)
	ninjastar_velocity = v
	local walkspeed = tonumber(minetest.settings:get"movement_speed_walk") or 4
	entity_attack_delay = (walkspeed+1)/v
end
update_ninjastar_vel(ninjastarmod.ninjastar_velocity)

local ninjastar_gravity = ninjastarmod.ninjastar_gravity
ninjastarmod.register_on_configuring(function(name, v)
	if name == "ninjastar_velocity" then
		update_ninjastar_vel(v)
	elseif name == "ninjastar_gravity" then
		ninjastar_gravity = v
	end
end)

local function get_gravity()
	local grav = tonumber(minetest.settings:get"movement_gravity") or 9.81
	return grav*ninjastar_gravity
end

local someone_throwing, just_acitvated

--Shoot snowball
function ninjastarmod.shoot_ninjastar(item, player)
	local addp = {y = 1.625} -- + (math.random()-0.5)/5}
	local dir = player:get_look_dir()
	local dif = 2*math.sqrt(dir.z*dir.z+dir.x*dir.x)
	addp.x = dir.z/dif -- + (math.random()-0.5)/5
	addp.z = -dir.x/dif -- + (math.random()-0.5)/5
	local pos = vector.add(player:getpos(), addp)
	local obj = minetest.add_entity(pos, "ninjastarmod:EntityNinjaStar_wood")
	obj:setvelocity(vector.multiply(dir, ninjastar_velocity))
	obj:setacceleration({x=dir.x*-3, y=-get_gravity(), z=dir.z*-3})
	obj:get_luaentity().thrower = player:get_player_name()
	if creative_mode then
		if not someone_throwing then
			someone_throwing = true
			just_acitvated = true
		end
		return
	end
	item:take_item()
	return item
end

if creative_mode then
	local function update_step()
		local active
		for _,player in pairs(minetest.get_connected_players()) do
			if player:get_player_control().LMB then
				local item = player:get_wielded_item()
				local itemname = item:get_name()
				if itemname == "ninjastarmod:ItemNinjaStar_wood" then
					ninjastarmod.shoot_ninjastar(nil, player)
					active = true
					break
				end
			end
		end

		-- disable the function if noone currently throws them
		if not active then
			someone_throwing = false
		end
	end

	-- do automatic throwing using minetest.after
	local function do_step()
		local timer
		-- only if one holds left click
		if someone_throwing
		and not just_acitvated then
			update_step()
			timer = 0.006
		else
			timer = 0.5
			just_acitvated = false
		end
		minetest.after(timer, do_step)
	end
	minetest.after(3, do_step)
end

--The NinjaStar Entity
local EntityNinjaStar_wood = {
	physical = false,
	timer = 0,
	collisionbox = {-5/16,-5/16,-5/16, 5/16,5/16,5/16},
}

function EntityNinjaStar_wood.on_activate(self)
	self.object:set_properties({textures = {"ItemNinjaStar_wood.png^[transform"..math.random(0,7)}})
	self.object:setacceleration({x=0, y=-get_gravity(), z=0})
	self.lastpos = self.object:getpos()
	minetest.after(0.1, function(obj)
		if not obj then
			return
		end
		local vel = obj:getvelocity()
		if vel
		and vel.y ~= 0 then
			return
		end
		minetest.after(0, function(obj)
			if not obj then
				return
			end
			local vel = obj:getvelocity()
			if not vel
			or vel.y == 0 then
				obj:remove()
			end
		end, obj)
	end, self.object)
end

--Snowball_entity.on_step()--> called when snowball is moving.
function EntityNinjaStar_wood.on_step(self, dtime)
	self.timer = self.timer+dtime
	if self.timer > 600 then
		-- 10 minutes are too long for a snowball to fly somewhere
		self.object:remove()
		return
	end

	if self.physical then
		local fell = self.object:getvelocity().y == 0
		if not fell then
			return
		end
		local pos = vector.round(self.object:getpos())
		if minetest.get_node(pos).name == "air" then
			pos.y = pos.y-1
			if minetest.get_node(pos).name == "air" then
				return
			end
		end
		snow.place(pos)
		self.object:remove()
		return
	end

	local pos = vector.round(self.object:getpos())
	if vector.equals(pos, self.lastpos) then
		return
	end
	if minetest.get_node(pos).name ~= "air" then
		self.object:setacceleration({x=0, y=-get_gravity(), z=0})
		--self.object:setvelocity({x=0, y=0, z=0})
		pos = self.lastpos
		self.object:setpos(pos)
		minetest.sound_play("NinjaStarHit", {pos=pos, gain=vector.length(self.object:getvelocity())/30})
		self.object:set_properties({physical = true})
		self.physical = true
		return
	end
	self.lastpos = vector.new(pos)

	if self.timer < entity_attack_delay then
		return
	end
	for _,v in pairs(minetest.get_objects_inside_radius(pos, 1.73)) do
		local entity = v:get_luaentity()
		if v ~= self.object
		and entity then
			local entity_name = entity.name
			if v:is_player()
			or (entity_name ~= "ninjastarmod:EntityNinjaStar_wood"
			and entity_name ~= "__builtin:item"
			and entity_name ~= "gauges:hp_bar") then
				local vvel = v:getvelocity() or v:get_player_velocity()
				local veldif = self.object:getvelocity()
				if vvel then
					veldif = vector.subtract(veldif, vvel)
				end
				local gain = vector.length(veldif)/20
				v:punch(
					(self.thrower and minetest.get_player_by_name(self.thrower))
						or self.object,
					1,
					{full_punch_interval=1, damage_groups = {fleshy=math.ceil(gain)}}
				)
				minetest.sound_play("NinjaStarHit", {pos=pos, gain=gain})
				spawn_falling_node(pos, {name = "ninjastarmod:ItemNinjaStar_wood"})
				self.object:remove()
				return
			end
		end
	end
end



minetest.register_entity("ninjastarmod:EntityNinjaStar_wood", EntityNinjaStar_wood)


