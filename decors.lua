local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--Global

--New

--Shuffle

--Clear registered decorations is a massive thing, if I use it I will need to refactor the code significantly
--Also so many lines

--[[
	minetest.clear_registered_decorations()

	minetest.register_decoration({
		name = "default:blueberry_bush",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 697,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"grassland"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/blueberry_bush.mts",
		flags = "place_center_x, place_center_z",
	})
--]]

-- Cowberry

local function grow_new_cowberry(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x, y = pos.y, z = pos.z}, modpath.."/schematics/ebiomes_cowberry_bush.mts", "0", nil, false)
end
	
	minetest.register_craftitem("ebiomes:cowberries", {
		description = S("Cowberries"),
		inventory_image = "ebiomes_cowberries.png",
		groups = {food_cowberries = 1, food_berry = 1},
		on_use = minetest.item_eat(2),
	})
	
	
	minetest.register_node("ebiomes:cowberry_bush_leaves_with_berries", {
		description = S("Cowberry Bush Leaves with Berries"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_cowberry_bush_leaves.png^ebiomes_cowberry_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		walkable = false,
		drop = "ebiomes:cowberries",
		sounds = default.node_sound_leaves_defaults(),
		node_dig_prediction = "ebiomes:cowberry_bush_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "ebiomes:cowberry_bush_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})
	
	
	minetest.register_node("ebiomes:cowberry_bush_leaves", {
		description = S("Cowberry Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_cowberry_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		walkable = false,
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:cowberry_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:cowberry_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:cowberry_bush_leaves_with_berries"})
			end
		end,

		after_place_node = after_place_leaves,
	})
	

	minetest.register_node("ebiomes:cowberry_bush_sapling", {
		description = S("Cowberry Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_cowberry_bush_sapling.png"},
		inventory_image = "ebiomes_cowberry_bush_sapling.png",
		wield_image = "ebiomes_cowberry_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_cowberry,
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, -1 / 16, 2 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:cowberry_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})
	
	minetest.register_decoration({
		name = "ebiomes:cowberry_bush",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow", "default:permafrost_with_moss"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 697,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"taiga", "snowy_grassland", "tundra"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_cowberry_bush.mts",
		flags = "place_center_x, place_center_z",
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_sapling({
		{"ebiomes:cowberry_bush_sapling", grow_new_cowberry, "soil"},
	})
end



	minetest.register_decoration({
		name = "ebiomes:bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"warm_steppe", "cold_deciduous", "deciduous_forest_humid", "deciduous_forest_warm", "grassland_warm"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/bush.mts",
		flags = "place_center_x, place_center_z",
	})
	
	minetest.register_decoration({
		name = "ebiomes:pine_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 278,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"steppe", "cold_steppe", "cold_deciduous"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/pine_bush.mts",
		flags = "place_center_x, place_center_z",
	})

--Rainforest humid(keeping in global because uses non specific assets)

	minetest.register_decoration({
		name = "ebiomes:corals",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 7013,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"rainforest_humid_ocean",
		},
		y_max = -2,
		y_min = -8,
		flags = "force_placement",
		decoration = {
			"default:coral_green", "default:coral_pink",
			"default:coral_cyan", "default:coral_brown",
			"default:coral_orange", "default:coral_skeleton",
		},
	})
	
	minetest.register_decoration({
		name = "ebiomes:junglegrass",
		deco_type = "simple",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"rainforest_humid"},
		y_max = 31000,
		y_min = 1,
		decoration = "default:junglegrass",
	})
	
	minetest.register_decoration({
		name = "ebiomes:papyrus_on_dirt",
		deco_type = "schematic",
		place_on = {"default:dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"rainforest_humid_swamp"},
		y_max = 0,
		y_min = 0,
		schematic = minetest.get_modpath("default") .. "/schematics/papyrus_on_dirt.mts",
	})
	
	--flowers

	minetest.register_decoration({
		name = "ebiomes:dandelion",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.016,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 352,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"warm_steppe", "cold_deciduous", "deciduous_forest_humid", "deciduous_forest_warm", "grassland_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:dandelion_yellow",
	})
		
	minetest.register_decoration({
		name = "ebiomes:dandelion_white",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 353,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"warm_steppe", "cold_deciduous", "deciduous_forest_humid", "deciduous_forest_warm", "grassland_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:dandelion_white",
	})

	
	minetest.register_decoration({
		name = "ebiomes:tulip",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.012,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 356,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"cold_deciduous", "deciduous_forest_humid", "deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:tulip",
	})

	
	minetest.register_decoration({
		name = "ebiomes:tulip_black",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold", "default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.016,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 355,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"cold_deciduous", "deciduous_forest_humid"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:tulip_black",
	})
		
	minetest.register_decoration({
		name = "ebiomes:rose",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.004,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 357,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"deciduous_forest_humid", "deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:rose",
	})
		
	minetest.register_decoration({
		name = "ebiomes:chrysanthemum_green",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.016,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"cold_deciduous", "deciduous_forest_humid", "deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:chrysanthemum_green",
	})
		
	minetest.register_decoration({
		name = "ebiomes:blueberry_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 697,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"warm_steppe", "grassland_warm"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/blueberry_bush.mts",
		flags = "place_center_x, place_center_z",
	})
		
	minetest.register_decoration({
		name = "ebiomes:waterlily",
		deco_type = "simple",
		place_on = {"default:dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.12,
			scale = 0.3,
			spread = {x = 200, y = 200, z = 200},
			seed = 33,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"cold_deciduous_shore", "swamp_shore", "deciduous_forest_humid_shore", "deciduous_forest_warm_shore"},
		y_max = 0,
		y_min = 0,
		decoration = "flowers:waterlily_waving",
		param2 = 0,
		param2_max = 3,
		place_offset_y = 1,
	})

	--mushrooms
	
	minetest.register_decoration({
		name = "ebiomes:mushroom_brown",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"cold_deciduous", "deciduous_forest_humid", "deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:mushroom_brown",
	})
	
	minetest.register_decoration({
		name = "ebiomes:mushroom_red",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "deciduous_forest_warm", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"cold_deciduous", "deciduous_forest_humid", "deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:mushroom_brown",
	})

-- Kelp

	minetest.register_decoration({
		name = "ebiomes:kelp",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = -0.04,
			scale = 0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 87112,
			octaves = 3,
			persist = 0.7
		},
		biomes = {
			"cold_deciduous_ocean",
			"cold_steppe_ocean",
			"steppe_ocean",
			"warm_steppe_ocean",
			"deciduous_forest_humid_ocean",
			"sandstone_desert_buffer_ocean",
			"cold_desert_buffer_ocean",
			"arid_grassland_cool_ocean"
		},
		y_max = -5,
		y_min = -10,
		flags = "force_placement",
		decoration = "default:sand_with_kelp",
		param2 = 48,
		param2_max = 96,
	})
	
	-- Marram grass, not appealing right now

--[[
	minetest.register_decoration({
		name = "ebiomes:marram_grass",
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 4,
		noise_params = {
			offset = -0.7,
			scale = 4.0,
			spread = {x = 16, y = 16, z = 16},
			seed = 513337,
			octaves = 1,
			persist = 0.0,
			flags = "absvalue, eased"
		},
		biomes = {"cold_deciduous_shore", "cold_steppe_dunes", "steppe_dunes", "warm_steppe_dunes"},
		y_max = 6,
		y_min = 4,
		decoration = {
			"default:marram_grass_1",
			"default:marram_grass_2",
			"default:marram_grass_3",
		},
	})
--]]

	minetest.register_decoration({
		name = "ebiomes:dry_shrub",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_grass_arid_cool", "default:sand", "default:silver_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"cold_steppe", "grassland_arid", "grassland_arid_cool", "sandstone_desert_buffer", "cold_desert_buffer"},
		y_max = 31000,
		y_min = 2,
		decoration = "default:dry_shrub",
		param2 = 4,
	})

--Cold deciduous
		
local function grow_new_blackcurrant(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-2, y = pos.y, z = pos.z-2}, modpath.."/schematics/ebiomes_blackcurrant_bush.mts", "0", nil, false)
end
	
	minetest.register_craftitem("ebiomes:blackcurrants", {
		description = S("Blackcurants"),
		inventory_image = "ebiomes_blackcurrants.png",
		groups = {food_blackcurrants = 1, food_berry = 1},
		on_use = minetest.item_eat(2),
	})
	
	
	minetest.register_node("ebiomes:blackcurrant_bush_leaves_with_berries", {
		description = S("Blackcurrant Bush Leaves with Berries"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_blackcurrant_bush_leaves.png^ebiomes_blackcurrant_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		walkable = false,
		drop = "ebiomes:blackcurrants",
		sounds = default.node_sound_leaves_defaults(),
		node_dig_prediction = "ebiomes:blackcurrant_bush_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "ebiomes:blackcurrant_bush_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})
	
	
	minetest.register_node("ebiomes:blackcurrant_bush_leaves", {
		description = S("Blackcurrant Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_blackcurrant_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		walkable = false,
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:blackcurrant_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:blackcurrant_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:blackcurrant_bush_leaves_with_berries"})
			end
		end,

		after_place_node = after_place_leaves,
	})

	minetest.register_node("ebiomes:blackcurrant_bush_sapling", {
		description = S("Blackcurrant Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_blackcurrant_bush_sapling.png"},
		inventory_image = "ebiomes_blackcurrant_bush_sapling.png",
		wield_image = "ebiomes_blackcurrant_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_blackcurrant,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:blackcurrant_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})
	
	minetest.register_decoration({
		name = "ebiomes:blackcurrant_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 787,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"cold_deciduous"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_blackcurrant_bush.mts",
		flags = "place_center_x, place_center_z",
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:blackcurrant_bush_sapling", grow_new_blackcurrant, "soil"},
})
end
	
	
	
local function grow_new_redcurrant(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_redcurrant_bush.mts", "0", nil, false)
end
	
	minetest.register_craftitem("ebiomes:redcurrants", {
		description = S("Redcurants"),
		inventory_image = "ebiomes_redcurrants.png",
		groups = {food_redcurrants = 1, food_berry = 1},
		on_use = minetest.item_eat(2),
	})
	
	
	minetest.register_node("ebiomes:redcurrant_bush_leaves_with_berries", {
		description = S("Redcurrant Bush Leaves with Berries"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_redcurrant_bush_leaves.png^ebiomes_redcurrant_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		walkable = false,
		drop = "ebiomes:redcurrants",
		sounds = default.node_sound_leaves_defaults(),
		node_dig_prediction = "ebiomes:redcurrant_bush_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "ebiomes:redcurrant_bush_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})
	
	
	minetest.register_node("ebiomes:redcurrant_bush_leaves", {
		description = S("Redcurrant Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_redcurrant_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		walkable = false,
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:redcurrant_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:redcurrant_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:redcurrant_bush_leaves_with_berries"})
			end
		end,

		after_place_node = after_place_leaves,
	})

	minetest.register_node("ebiomes:redcurrant_bush_sapling", {
		description = S("Redcurrant Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_redcurrant_bush_sapling.png"},
		inventory_image = "ebiomes_redcurrant_bush_sapling.png",
		wield_image = "ebiomes_redcurrant_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_redcurrant,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:redcurrant_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})
	
	minetest.register_decoration({
		name = "ebiomes:redcurrant_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 878,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"cold_deciduous"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_redcurrant_bush.mts",
		flags = "place_center_x, place_center_z",
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:redcurrant_bush_sapling", grow_new_redcurrant, "soil"},
})
end
	
	
	
local function grow_new_gooseberry(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_gooseberry_bush.mts", "0", nil, false)
end
	
	minetest.register_craftitem("ebiomes:gooseberries", {
		description = S("Gooseberries"),
		inventory_image = "ebiomes_gooseberries.png",
		groups = {food_gooseberries = 1, food_berry = 1},
		on_use = minetest.item_eat(2),
	})
	
	
	minetest.register_node("ebiomes:gooseberry_bush_leaves_with_berries", {
		description = S("Gooseberry Bush Leaves with Berries"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_gooseberry_bush_leaves.png^ebiomes_gooseberry_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		walkable = false,
		damage_per_second = 1,
		drop = "ebiomes:gooseberries",
		sounds = default.node_sound_leaves_defaults(),
		node_dig_prediction = "ebiomes:gooseberry_bush_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "ebiomes:gooseberry_bush_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})
	
	
	minetest.register_node("ebiomes:gooseberry_bush_leaves", {
		description = S("Gooseberry Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_gooseberry_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		walkable = false,
		damage_per_second = 1,
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:gooseberry_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:gooseberry_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:gooseberry_bush_leaves_with_berries"})
			end
		end,

		after_place_node = after_place_leaves,
	})

	minetest.register_node("ebiomes:gooseberry_bush_sapling", {
		description = S("Gooseberry Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_gooseberry_bush_sapling.png"},
		inventory_image = "ebiomes_gooseberry_bush_sapling.png",
		wield_image = "ebiomes_gooseberry_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_gooseberry,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:gooseberry_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})
	
	minetest.register_decoration({
		name = "ebiomes:gooseberry_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 969,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"cold_deciduous"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_gooseberry_bush.mts",
		flags = "place_center_x, place_center_z",
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:gooseberry_bush_sapling", grow_new_gooseberry, "soil"},
})
end
	
	
	
--Swamp
	
	minetest.register_node("ebiomes:cranberry_patch", {
		description = S("Cranberry Patch"),
		tiles = {"ebiomes_cranberry_patch.png"},
		inventory_image = "ebiomes_cranberry_patch.png",
		wield_image = "ebiomes_cranberry_patch.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		drop = {
			max_items = 2,
			items = {
				{items = {"ebiomes:cranberries"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),
		after_place_node = function(pos, placer, itemstack)
			minetest.set_node(pos, {name = "ebiomes:cranberry_patch", param2 = 1})
		end,
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -3 / 16, 5 / 16},
		}
	})
	
	minetest.register_craftitem("ebiomes:cranberries", {
		description = S("Cranberries"),
		inventory_image = "ebiomes_cranberries.png",
		groups = {food_cranberries = 1, food_berry = 1},
		on_use = minetest.item_eat(2),
	})
	
	
	minetest.register_decoration({
		name = "ebiomes:cranberry",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_swamp"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.007,
			spread = {x = 100, y = 100, z = 100},
			seed = 131,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:cranberry_patch",
	})
	
	
	minetest.register_node("ebiomes:sundew", {
		description = S("Sundew"),
		tiles = {"ebiomes_sundew.png"},
		inventory_image = "ebiomes_sundew.png",
		wield_image = "ebiomes_sundew.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -6 / 16, 4 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:sundew",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_swamp"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.007,
			spread = {x = 100, y = 100, z = 100},
			seed = 513,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:sundew",
	})

	minetest.register_node("ebiomes:marigold", {
		description = S("Marsh Marigold"),
		tiles = {"ebiomes_marigold.png"},
		inventory_image = "ebiomes_marigold.png",
		wield_image = "ebiomes_marigold.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -6 / 16, 4 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:marigold",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_swamp"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.007,
			spread = {x = 100, y = 100, z = 100},
			seed = 514,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:marigold",
	})

	minetest.register_node("ebiomes:marsh_stitchwort", {
		description = S("Marsh Stitchwort"),
		tiles = {"ebiomes_marsh_stitchwort.png"},
		inventory_image = "ebiomes_marsh_stitchwort.png",
		wield_image = "ebiomes_marsh_stitchwort.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-5 / 16, -0.5, -5 / 16, 5 / 16, -2 / 16, 5 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:marsh_stitchwort",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_swamp"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.007,
			spread = {x = 100, y = 100, z = 100},
			seed = 515,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:marsh_stitchwort",
	})	
	
	
	
--Mediterranean

	minetest.register_node("ebiomes:black_iris", {
		description = S("Black Iris"),
		tiles = {"ebiomes_black_iris.png"},
		inventory_image = "ebiomes_black_iris.png",
		wield_image = "ebiomes_black_iris.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:black_iris",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 380,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:black_iris",
	})
	
	
	
	
	minetest.register_node("ebiomes:cladanthus", {
		description = S("Cladanthus"),
		tiles = {"ebiomes_cladanthus.png"},
		inventory_image = "ebiomes_cladanthus.png",
		wield_image = "ebiomes_cladanthus.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:cladanthus",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 381,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:cladanthus",
	})
	
	
	minetest.register_node("ebiomes:savory", {
		description = S("Savory"),
		tiles = {"ebiomes_savory.png"},
		inventory_image = "ebiomes_savory.png",
		wield_image = "ebiomes_savory.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:savory",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 382,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:savory",
	})
	
	
	minetest.register_node("ebiomes:staehelina", {
		description = S("Staehelina"),
		tiles = {"ebiomes_staehelina.png"},
		inventory_image = "ebiomes_staehelina.png",
		wield_image = "ebiomes_staehelina.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -4 / 16, 3 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:staehelina",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 383,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:staehelina",
	})

local function grow_new_bush_warm(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y-1, z = pos.z-1}, modpath.."/schematics/ebiomes_bush_warm.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:bush_stem_warm", {
		description = S("Warm Biome Bush Stem"),
		drawtype = "plantlike",
		visual_scale = 1.41,
		tiles = {"ebiomes_bush_stem_warm.png"},
		inventory_image = "ebiomes_bush_stem_warm.png",
		wield_image = "ebiomes_bush_stem_warm.png",
		paramtype = "light",
		sunlight_propagates = true,
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
		},
	})

	minetest.register_node("ebiomes:bush_leaves_warm", {
		description = S("Warm Biome Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_bush_leaves_warm.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:bush_sapling_warm"}, rarity = 5},
				{items = {"ebiomes:bush_leaves_warm"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})

	minetest.register_node("ebiomes:bush_sapling_warm", {
		description = S("Warm Biome Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_bush_sapling_warm.png"},
		inventory_image = "ebiomes_bush_sapling_warm.png",
		wield_image = "ebiomes_bush_sapling_warm.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_sapling,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:bush_sapling_warm",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})


	default.register_leafdecay({
		trunks = {"ebiomes:bush_stem_warm"},
		leaves = {"ebiomes:bush_leaves_warm"},
		radius = 1,
	})

	minetest.register_decoration({
		name = "ebiomes:bush_warm",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"mediterranean"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_bush_warm.mts",
		flags = "place_center_x, place_center_z",
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_sapling({
		{"ebiomes:bush_sapling_warm", grow_new_bush_warm, "soil"},
	})
end

	minetest.register_craft({
		output = "default:wood",
		recipe = {
			{"ebiomes:bush_stem_warm"},
		}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:bush_stem_warm",
		burntime = 8,
	})
	
	
	
	
local function grow_new_hardy_bush(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y-1, z = pos.z-1}, modpath.."/schematics/ebiomes_hardy_bush.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:hardy_bush_stem", {
		description = S("Hardy Bush Stem"),
		drawtype = "plantlike",
		visual_scale = 1.41,
		tiles = {"ebiomes_hardy_bush_stem.png"},
		inventory_image = "ebiomes_hardy_bush_stem.png",
		wield_image = "ebiomes_hardy_bush_stem.png",
		paramtype = "light",
		sunlight_propagates = true,
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 1},
		sounds = default.node_sound_wood_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
		},
	})

	minetest.register_node("ebiomes:hardy_bush_leaves", {
		description = S("Hardy Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_hardy_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, flammable = 1, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:hardy_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:hardy_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})

	minetest.register_node("ebiomes:hardy_bush_sapling", {
		description = S("Hardy Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_hardy_bush_sapling.png"},
		inventory_image = "ebiomes_hardy_bush_sapling.png",
		wield_image = "ebiomes_hardy_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_sapling,
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:hardy_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})


	default.register_leafdecay({
		trunks = {"ebiomes:hardy_bush_stem"},
		leaves = {"ebiomes:hardy_bush_leaves"},
		radius = 1,
	})

	minetest.register_decoration({
		name = "ebiomes:hardy_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_grass_arid_cool"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"grassland_arid", "grassland_arid_cool"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hardy_bush.mts",
		flags = "place_center_x, place_center_z",
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
	bonemeal:add_sapling({
		{"ebiomes:hardy_bush_sapling", grow_new_hardy_bush, "soil"},
	})
end

	minetest.register_craft({
		output = "default:wood",
		recipe = {
			{"ebiomes:hardy_bush_stem"},
		}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:hardy_bush_stem",
		burntime = 8,
	})
	
	
	
	
	
	
local function grow_new_thorn(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_thorn_bush.mts", "0", nil, false)
end
		
	minetest.register_node("ebiomes:thorn_bush_leaves", {
		description = S("Thorn Bush Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_thorn_bush_leaves.png"},
		paramtype = "light",
		groups = {snappy = 1, flammable = 1, leaves = 1},
		walkable = false,
		damage_per_second = 2,
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:thorn_bush_sapling"}, rarity = 5},
				{items = {"ebiomes:thorn_bush_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = after_place_leaves,
	})

	minetest.register_node("ebiomes:thorn_bush_sapling", {
		description = S("Thorn Bush Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_thorn_bush_sapling.png"},
		inventory_image = "ebiomes_thorn_bush_sapling.png",
		wield_image = "ebiomes_thorn_bush_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_thorn,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:thorn_bush_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 1, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})
	
	minetest.register_decoration({
		name = "ebiomes:thorn_bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_grass_arid_cool"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 969,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"grassland_arid", "grassland_arid_cool"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_thorn_bush.mts",
		flags = "place_center_x, place_center_z",
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:thorn_bush_sapling", grow_new_thorn, "soil"},
})
end
	
	
	
	
	
	
	
	
	

	minetest.register_node("ebiomes:larkspur", {
		description = S("Larkspur"),
		tiles = {"ebiomes_larkspur.png"},
		inventory_image = "ebiomes_larkspur.png",
		wield_image = "ebiomes_larkspur.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:larkspur",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 384,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:larkspur",
	})
	
	
	minetest.register_node("ebiomes:buttercup_persian", {
		description = S("Persian Buttercup"),
		tiles = {"ebiomes_buttercup_persian.png"},
		inventory_image = "ebiomes_buttercup_persian.png",
		wield_image = "ebiomes_buttercup_persian.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -2 / 16, 4 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:buttercup_persian",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 385,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:buttercup_persian",
	})
	
	
	
	
	minetest.register_node("ebiomes:chrysanthemum_yellow", {
		description = S("Yellow Chrysanthemum"),
		tiles = {"ebiomes_chrysanthemum_yellow.png"},
		inventory_image = "ebiomes_chrysanthemum_yellow.png",
		wield_image = "ebiomes_chrysanthemum_yellow.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1, color_yellow = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:chrysanthemum_yellow",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 386,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:chrysanthemum_yellow",
	})
		
--Mediterranean grassland
--none


--Steppes

--Plantlife	
	
	minetest.register_node("ebiomes:blue_allium", {
		description = S("Blue Allium"),
		tiles = {"ebiomes_blue_allium.png"},
		inventory_image = "ebiomes_blue_allium.png",
		wield_image = "ebiomes_blue_allium.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:blue_allium",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 333,
			octaves = 3,
			persist = 0.004
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:blue_allium",
	})

	minetest.register_node("ebiomes:blue_allium_purple", {
		description = S("Purple Blue Allium"),
		tiles = {"ebiomes_blue_allium_purple.png"},
		inventory_image = "ebiomes_blue_allium_purple.png",
		wield_image = "ebiomes_blue_allium_purple.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:blue_allium_purple",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe"},
		sidelen = 16,
		noise_params = {
			offset = 0.004,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 335,
			octaves = 3,
			persist = 0.03
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:blue_allium_purple",
	})
	
	minetest.register_node("ebiomes:altai_tulip", {
		description = S("Altai Tulip"),
		tiles = {"ebiomes_altai_tulip.png"},
		inventory_image = "ebiomes_altai_tulip.png",
		wield_image = "ebiomes_altai_tulip.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:altai_tulip",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 350,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:altai_tulip",
	})
		
	--warm
	
	minetest.register_node("ebiomes:russian_iris", {
		description = S("Russian Iris"),
		tiles = {"ebiomes_russian_iris.png"},
		inventory_image = "ebiomes_russian_iris.png",
		wield_image = "ebiomes_russian_iris.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:russian_iris",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 350,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:russian_iris",
	})
		
	--cold
	
	minetest.register_node("ebiomes:siberian_lily", {
		description = S("Siberian Lily"),
		tiles = {"ebiomes_siberian_lily.png"},
		inventory_image = "ebiomes_siberian_lily.png",
		wield_image = "ebiomes_siberian_lily.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -1 / 16, 3 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:siberian_lily",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 350,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:siberian_lily",
	})
	
	
	minetest.register_node("ebiomes:mountain_lily", {
		description = S("Mountain Lily"),
		tiles = {"ebiomes_mountain_lily.png"},
		inventory_image = "ebiomes_mountain_lily.png",
		wield_image = "ebiomes_mountain_lily.png",
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {flower = 1, snappy = 3, attached_node = 1, flammable = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
		}
	})

	minetest.register_decoration({
		name = "ebiomes:mountain_lily",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 351,
			octaves = 3,
			persist = 0.05
		},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:mountain_lily",
	})
		


local function grow_new_peashrub(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-1, y = pos.y, z = pos.z-1}, modpath.."/schematics/ebiomes_peashrub.mts", "0", nil, false)
end
	
	
	minetest.register_craftitem("ebiomes:peashrub_peas", {
		description = S("Peashrub Peas"),
		inventory_image = "ebiomes_peashrub_peas.png",
		groups = {cooking_peas = 1},
	})
	
	minetest.register_craftitem("ebiomes:peas_cooked", {
		description = S("Cooked Peas"),
		inventory_image = "ebiomes_peas_cooked.png",
		groups = {food_peas = 1},
		on_use = minetest.item_eat(5),
	})

	minetest.register_craftitem("ebiomes:bucket_peas", {
		description = S("Bucket of Peas"),
		inventory_image = "ebiomes_bucket_peas.png",
		groups = {cookables_peas = 1},
	})

	minetest.register_craft({
		output = "ebiomes:bucket_peas",
		recipe = {
			{"bucket:bucket_water", "group:cooking_peas"},
		}
	})

	minetest.register_craft({
		output = "ebiomes:bucket_peas",
		recipe = {
			{"bucket:bucket_river_water", "group:cooking_peas"},
		}
	})

	minetest.register_craft({
		type = "cooking",
		output = "ebiomes:peas_cooked",
		recipe = "ebiomes:bucket_peas",
		replacements = {{"ebiomes:bucket_peas", "bucket:bucket_empty"}},
		cooktime = 5,
	})
	
	minetest.register_node("ebiomes:peashrub_leaves_with_peas", {
		description = S("Peashrub Bush Leaves with Peas"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_peashrub_leaves.png^ebiomes_peashrub_overlay.png"},
		paramtype = "light",
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1, dig_immediate = 3},
		drop = "ebiomes:peashrub_peas",
		sounds = default.node_sound_leaves_defaults(),
		node_dig_prediction = "ebiomes:peashrub_leaves",

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name = "ebiomes:peashrub_leaves"})
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
	})
	
	
	minetest.register_node("ebiomes:peashrub_leaves", {
		description = S("Peashrub Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_peashrub_leaves.png"},
		paramtype = "light",
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:peashrub_sapling"}, rarity = 5},
				{items = {"ebiomes:peashrub_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		on_timer = function(pos, elapsed)
			if minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:peashrub_leaves_with_peas"})
			end
		end,

		after_place_node = after_place_leaves,
	})
	
	default.register_leafdecay({
		trunks = {"default:pine_bush_stem"},
		leaves = {"ebiomes:peashrub_leaves", "ebiomes:peashrub_leaves_with_peas"},
		radius = 3,
	})

	minetest.register_node("ebiomes:peashrub_sapling", {
		description = S("Peashrub Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_peashrub_sapling.png"},
		inventory_image = "ebiomes_peashrub_sapling.png",
		wield_image = "ebiomes_peashrub_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_peashrub,
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:peashrub_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				{x = -1, y = 0, z = -1},
				{x = 1, y = 3, z = 1},
				-- maximum interval of interior volume check
				2)

			return itemstack
		end,
	})
	
	minetest.register_decoration({
		name = "ebiomes:peashrub",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 969,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"steppe", "cold_steppe"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_peashrub.mts",
		flags = "place_center_x, place_center_z",
	})
	
if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:peashrub_sapling", grow_new_peashrub, "soil"},
})
end


