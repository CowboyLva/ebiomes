local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--Aliases

minetest.register_alias("bamboo", "ebiomes:bamboo")
minetest.register_alias("bamboo_leaves", "ebiomes:bamboo_leaves")
minetest.register_alias("bamboo_sprout", "ebiomes:bamboo_sprout")


--Bamboo

	minetest.register_node("ebiomes:bamboo", {
		description = S("Bamboo"),
		drawtype = "plantlike",
		tiles = {"ebiomes_bamboo.png"},
		inventory_image = "ebiomes_bamboo.png",
		wield_image = "ebiomes_bamboo.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0.5, 3 / 16},
		},
		groups = {choppy = 3, snappy = 2, flammable = 2, oddly_breakable_by_hand = 2},
		sounds = default.node_sound_wood_defaults(),
		
		after_dig_node = function(pos, node, metadata, digger)
			default.dig_up(pos, node, digger)
		end,
	})

	minetest.register_craft({
		output = "default:stick 8",
		recipe = {
			{"ebiomes:bamboo"},
		}
	})

	minetest.register_node("ebiomes:bamboo_leaves", {
		description = S("Bamboo Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_bamboo_leaves.png"},
		waving = 1,
		walkable = false,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:bamboo_sprout"}, rarity = 20},
				{items = {"ebiomes:bamboo_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:bamboo"},
		leaves = {"ebiomes:bamboo_leaves"},
		radius = 3,
	})

local function grow_new_bamboo(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_bamboo.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:bamboo_sprout", {
		description = S("Bamboo Sprout"),
		drawtype = "plantlike",
		tiles = {"ebiomes_bamboo_sprout.png"},
		inventory_image = "ebiomes_bamboo_sprout.png",
		wield_image = "ebiomes_bamboo_sprout.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_bamboo,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),
	
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	
		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:bamboo_sprout",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -1, y = 1, z = -1},
				{x = 1, y = 6, z = 1},
				-- maximum interval of interior volume check
				4)
	
			return itemstack
		end,
	})

if minetest.settings:get_bool("reg_jprainforest", true) then

	minetest.register_decoration({
		name = "ebiomes:bamboo_l1",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter", "default:dirt_with_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.0001,
			scale = 0.0001,
			spread = {x = 250, y = 250, z = 250},
			seed = 221,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest", "rainforest"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_bamboo.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random"
	})
	
	minetest.register_decoration({
		name = "ebiomes:bamboo_l2",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter", "default:dirt_with_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.9,
			scale = 0.9,
			spread = {x = 250, y = 250, z = 250},
			seed = 222,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest", "rainforest"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_bamboo.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
		spawn_by = "ebiomes:bamboo",
		num_spawn_by = 1
	})
	
	minetest.register_decoration({
		name = "ebiomes:bamboo_l3",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_japanese_rainforest_litter", "default:dirt_with_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.9,
			scale = 0.9,
			spread = {x = 250, y = 250, z = 250},
			seed = 223,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"japanese_rainforest", "rainforest"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_bamboo.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
		spawn_by = "ebiomes:bamboo",
		num_spawn_by = 1
	})
	
else

	minetest.register_decoration({
		name = "ebiomes:bamboo_l1",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.0001,
			scale = 0.0001,
			spread = {x = 250, y = 250, z = 250},
			seed = 221,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"rainforest"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_bamboo.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random"
	})
	
	minetest.register_decoration({
		name = "ebiomes:bamboo_l2",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.9,
			scale = 0.9,
			spread = {x = 250, y = 250, z = 250},
			seed = 222,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"rainforest"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_bamboo.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
		spawn_by = "ebiomes:bamboo",
		num_spawn_by = 1
	})
	
	minetest.register_decoration({
		name = "ebiomes:bamboo_l3",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0.9,
			scale = 0.9,
			spread = {x = 250, y = 250, z = 250},
			seed = 223,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"rainforest"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_bamboo.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
		spawn_by = "ebiomes:bamboo",
		num_spawn_by = 1
	})

end


if minetest.global_exists("dungeon_loot") then
	dungeon_loot.register ({
		{name = "ebiomes:bamboo", chance = 0.3, count = {5, 13}},
	})	
end
	
if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_sapling({
		{"ebiomes:bamboo_sprout", grow_new_bamboo, "soil"},
	})
end

if minetest.global_exists("flowerpot") then
	flowerpot.register_node("ebiomes:bamboo_sprout")
end



