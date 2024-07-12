local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--Globals

--Aliases

minetest.register_alias("desert_sand_with_debris", "ebiomes:desert_sand_with_debris")
minetest.register_alias("sand_with_debris", "ebiomes:sand_with_debris")
minetest.register_alias("silver_sand_with_debris", "ebiomes:silver_sand_with_debris")

--Biome basics

	-- Blob ore.
	-- These before scatter ores to avoid other ores in blobs.

	-- Clay

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:clay",
		wherein         = {"default:dirt"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = -1,
		y_min           = -3,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"deciduous_forest_cold", "deciduous_forest_cold_shore", "deciduous_forest_warm", "deciduous_forest_warm_shore", "temperate_rainforest"}
	})

	-- Dirt

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:dirt",
		wherein         = {"default:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
		-- Only where default:dirt is present as surface material
		biomes = {"deciduous_forest_cold", "meditarranean", "warm_steppe", "steppe", "cold_steppe", "deciduous_forest_warm", "japanese_rainforest", "temperate_rainforest", "jungle_savanna"}
	})


--Debris

-- Desert sand with debris

	minetest.register_node("ebiomes:desert_sand_with_debris", {
	    description = S("Desert Sand with Debris"),
	    tiles = {"ebiomes_desert_sand_with_debris.png"},
	    groups = {crumbly = 3, falling_node = 1, sand = 1},
        drop = "default:desert_sand",
	    sounds = default.node_sound_sand_defaults(),
	})

    minetest.register_craft({
	    output = "ebiomes:desert_sand_with_debris",
	    recipe = {
	    	{"default:desert_sand"}
	    }
    })

    minetest.register_craft({
	    output = "default:desert_sand",
	    recipe = {
	    	{"ebiomes:desert_sand_with_debris"}
	    }
    })


	minetest.register_decoration({
		name = "ebiomes:desert_sand_with_debris_l1",
		deco_type = "simple",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.04,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
--		biomes = {"sandstone_desert", "sandstone_desert_buffer"},
		height = 1,
		y_min = 7,
		y_max = 31000,
		place_offset_y = -1,
		decoration = "ebiomes:desert_sand_with_debris",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:desert_sand_with_debris_l1_low",
		deco_type = "simple",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0.1,
			scale = 0.04,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
--		biomes = {"sandstone_desert", "sandstone_desert_buffer"},
		height = 1,
		y_min = -1,
		y_max = 6,
		place_offset_y = -1,
		decoration = "ebiomes:desert_sand_with_debris",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ebiomes:desert_sand_with_debris_l2",
		deco_type = "simple",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0.9,
			scale = 0.9,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
--		biomes = {"sandstone_desert", "sandstone_desert_buffer"},
		height = 1,
		y_min = -1,
		y_max = 31000,
		place_offset_y = -1,
		decoration = "ebiomes:desert_sand_with_debris",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = "ebiomes:desert_sand_with_debris",
		num_spawn_by = 1
	})


-- Sand with debris

	minetest.register_node("ebiomes:sand_with_debris", {
	    description = S("Sand with Debris"),
	    tiles = {"ebiomes_sand_with_debris.png"},
	    groups = {crumbly = 3, falling_node = 1, sand = 1},
        drop = "default:sand",
	    sounds = default.node_sound_sand_defaults(),
	})

    minetest.register_craft({
	    output = "ebiomes:sand_with_debris",
	    recipe = {
	    	{"default:sand"}
	    }
    })

    minetest.register_craft({
	    output = "default:sand",
	    recipe = {
	    	{"ebiomes:sand_with_debris"}
	    }
    })

	minetest.register_decoration({
		name = "ebiomes:sand_with_debris_l1",
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.04,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
--		biomes = {"desert"},
		height = 1,
		y_min = 7,
		y_max = 31000,
		place_offset_y = -1,
		decoration = "ebiomes:sand_with_debris",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:sand_with_debris_l1_low",
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 16,
		noise_params = {
			offset = 0.1,
			scale = 0.04,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
--		biomes = {"desert"},
		height = 1,
		y_min = -1,
		y_max = 6,
		place_offset_y = -1,
		decoration = "ebiomes:sand_with_debris",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ebiomes:sand_with_debris_l2",
		deco_type = "simple",
		place_on = {"default_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0.9,
			scale = 0.9,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
--		biomes = {"desert"},
		height = 1,
		y_min = -1,
		y_max = 31000,
		place_offset_y = -1,
		decoration = "ebiomes:sand_with_debris",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = "ebiomes:sand_with_debris",
		num_spawn_by = 1
	})


-- Silver sand with debris

	minetest.register_node("ebiomes:silder_sand_with_debris", {
	    description = S("Silver Sand with Debris"),
	    tiles = {"ebiomes_desert_sand_with_debris.png"},
	    groups = {crumbly = 3, falling_node = 1, sand = 1},
        drop = "default:silver_sand",
	    sounds = default.node_sound_sand_defaults(),
	})

    minetest.register_craft({
	    output = "ebiomes:silver_sand_with_debris",
	    recipe = {
	    	{"default:silver_sand"}
	    }
    })

    minetest.register_craft({
	    output = "default:silver_sand",
	    recipe = {
	    	{"ebiomes:silver_sand_with_debris"}
	    }
    })


	minetest.register_decoration({
		name = "ebiomes:silver_sand_with_debris_l1",
		deco_type = "simple",
		place_on = {"default:silver_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.04,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
--		biomes = {"cold_desert", "cold_desert_buffer"},
		height = 1,
		y_min = 7,
		y_max = 31000,
		place_offset_y = -1,
		decoration = "ebiomes:silver_sand_with_debris",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:silver_sand_with_debris_l1_low",
		deco_type = "simple",
		place_on = {"default:silver_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0.1,
			scale = 0.04,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
--		biomes = {"cold_desert", "cold_desert_buffer"},
		height = 1,
		y_min = -1,
		y_max = 6,
		place_offset_y = -1,
		decoration = "ebiomes:silver_sand_with_debris",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})
	
	minetest.register_decoration({
		name = "ebiomes:silver_sand_with_debris_l2",
		deco_type = "simple",
		place_on = {"default_silver_sand"},
		sidelen = 16,
		noise_params = {
			offset = 0.9,
			scale = 0.9,
			spread = {x = 250, y = 250, z = 250},
			seed = 21,
			octaves = 3,
			persist = 0.66
		},
--		biomes = {"cold_desert"},
		height = 1,
		y_min = -1,
		y_max = 31000,
		place_offset_y = -1,
		decoration = "ebiomes:silver_sand_with_debris",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
		spawn_by = "ebiomes:silver_sand_with_debris",
		num_spawn_by = 1
	})

--[[
--Marram grass (template)

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
		biomes = {"warm_steppe_dunes", "steppe_dunes", "cold_steppe_dunes", "deciduous_forest_cold_shore"},
		y_max = 6,
		y_min = 4,
		decoration = {
			"default:marram_grass_1",
			"default:marram_grass_2",
			"default:marram_grass_3",
		},
	})
--]]

--Marram grass on debris

	-- Marram grass

	minetest.register_decoration({
		name = "ebiomes:marram_grass_debris",
		deco_type = "simple",
		place_on = {"ebiomes:sand_with_debris"},
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
		biomes = {"coniferous_forest_dunes", "grassland_dunes"},
		y_max = 6,
		y_min = 4,
		decoration = {
			"default:marram_grass_1",
			"default:marram_grass_2",
			"default:marram_grass_3",
		},
	})


--Decors

	minetest.register_decoration({
		name = "ebiomes:coral",
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
			"humid_savanna_ocean",
			"jungle_savanna_ocean",
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
		name = "ebiomes:bush",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"warm_steppe", "deciduous_forest_cold", "deciduous_forest_warm", "grassland_warm"},
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
		biomes = {"steppe", "cold_steppe", "deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/pine_bush.mts",
		flags = "place_center_x, place_center_z",
	})

--Trees

	minetest.register_decoration({
		name = "ebiomes:aspen_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = -0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 104,
			octaves = 3,
			persist = 0.06
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/aspen_tree.mts",
		flags = "place_center_x, place_center_z",
	})
	
	minetest.register_decoration({
		name = "ebiomes:aspen_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_aspen_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})



	minetest.register_decoration({
		name = "ebiomes:small_pine_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = -0.005,
			spread = {x = 250, y = 250, z = 250},
			seed = 101,
			octaves = 3,
			persist = 0.03
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/small_pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "ebiomes:pine_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_pine_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})
	
	--Acacia

	minetest.register_decoration({
		name = "ebiomes:acacia_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"humid_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/acacia_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:acacia_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"humid_savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/acacia_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "default:dry_dirt_with_dry_grass"
	})
	
	
	--flowers

	minetest.register_decoration({
		name = "ebiomes:dandelion",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.016,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 352,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"warm_steppe", "deciduous_forest_cold", "deciduous_forest_warm", "grassland_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:dandelion_yellow",
	})
		
	minetest.register_decoration({
		name = "ebiomes:dandelion_white",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 353,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"warm_steppe", "deciduous_forest_cold", "deciduous_forest_warm", "grassland_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:dandelion_white",
	})

	
	minetest.register_decoration({
		name = "ebiomes:tulip",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.012,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 356,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"deciduous_forest_cold", "deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:tulip",
	})

	
	minetest.register_decoration({
		name = "ebiomes:tulip_black",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.016,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 355,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"deciduous_forest_cold"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:tulip_black",
	})
		
	minetest.register_decoration({
		name = "ebiomes:rose",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.004,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 357,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"deciduous_forest_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:rose",
	})
		
	minetest.register_decoration({
		name = "ebiomes:chrysanthemum_green",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.016,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"deciduous_forest_cold", "deciduous_forest_warm"},
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
		biomes = {"deciduous_forest_cold_shore", "swamp_shore", "deciduous_forest_warm_shore"},
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
		place_on = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold", "deciduous_forest_warm", "japanese_rainforest"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:mushroom_brown",
	})
	
	minetest.register_decoration({
		name = "ebiomes:mushroom_red",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_japanese_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold", "deciduous_forest_warm", "japanese_rainforest"},
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
			"deciduous_forest_cold_ocean",
			"cold_steppe_ocean",
			"steppe_ocean",
			"warm_steppe_ocean",
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
	

	minetest.register_decoration({
		name = "ebiomes:dry_shrub",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_grass_arid_cool", "default:desert_sand", "default:silver_sand"},
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


