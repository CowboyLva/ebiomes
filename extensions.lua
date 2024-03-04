local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

--Global ores/dirt patches

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
		biomes = {"grassland_coldish", "deciduous_forest_fruity", "deciduous_forest_woody"}
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
		biomes = {"grassland_coldish", "deciduous_forest_fruity", "deciduous_forest_woody"}
	})
	
	
	-- Deciduous forests

	-- Warmish/Fruity


	minetest.register_biome({
		name = "deciduous_forest_fruity",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 1,
		heat_point = 64,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_fruity_shore",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 0,
		y_min = -1,
		heat_point = 64,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_fruity_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 64,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_fruity_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 64,
		humidity_point = 68,
	})
	
	
	
	-- Coldish/Woody
	
	minetest.register_biome({
		name = "deciduous_forest_woody",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 1,
		heat_point = 56,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_woody_shore",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 0,
		y_min = -1,
		heat_point = 56,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_woody_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 56,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_woody_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 56,
		humidity_point = 68,
	})
	
	
	
	
	
	-- Grasslands
	
	
	-- Coldish

	minetest.register_biome({
		name = "grassland_coldish",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 6,
		heat_point = 42,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_coldish_dunes",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = 5,
		y_min = 4,
		heat_point = 42,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_coldish_ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 3,
		y_min = -255,
		heat_point = 42,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_coldish_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 42,
		humidity_point = 35,
	})

-- Common All

--Grass


	for length = 1, 5 do
		minetest.register_decoration({
			name = "ebiomes:grassext_"..length,
			deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = 0.01,
				scale = 0.01,
				spread = {x = 200, y = 200, z = 200},
				seed = 329,
				octaves = 3,
				persist = 0.6
			},
			biomes = {"grassland_coldish", "deciduous_forest_fruity", "deciduous_forest_woody"},
			y_max = 31000,
			y_min = 1,
			decoration = "default:grass_"..length,
		})
	end
	
-- Flowers

	--flowers

	minetest.register_decoration({
		name = "ebiomes:dandelionext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland_coldish", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:dandelion_yellow",
	})
		
	minetest.register_decoration({
		name = "ebiomes:dandelion_whiteext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland_coldish", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:dandelion_white",
	})

	
	minetest.register_decoration({
		name = "ebiomes:tulipext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland_coldish", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:tulip",
	})

	
	minetest.register_decoration({
		name = "ebiomes:tulip_blackext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland_coldish", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:tulip_black",
	})
		
	minetest.register_decoration({
		name = "ebiomes:roseext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland_coldish", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:rose",
	})
		
	minetest.register_decoration({
		name = "ebiomes:chrysanthemum_greenext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland_coldish", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:chrysanthemum_green",
	})
	
	minetest.register_decoration({
		name = "ebiomes:geraniumext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland_coldish", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:geranium",
	})


-- Common Forest

	-- Apple tree and log

	minetest.register_decoration({
		name = "ebiomes:apple_treeext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.024,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/apple_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:apple_logext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/apple_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = "default:dirt_with_grass",
		num_spawn_by = 8,
	})


	minetest.register_decoration({
		name = "ebiomes:waterlilyext",
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
		biomes = {"deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 0,
		y_min = 0,
		decoration = "flowers:waterlily_waving",
		param2 = 0,
		param2_max = 3,
		place_offset_y = 1,
	})

	--mushrooms
	
	minetest.register_decoration({
		name = "ebiomes:mushroom_brownext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:mushroom_brown",
	})
	
	minetest.register_decoration({
		name = "ebiomes:mushroom_redext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:mushroom_brown",
	})

-- Common Grassland

	minetest.register_decoration({
		name = "ebiomes:bushext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"grassland_coldish"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/bush.mts",
		flags = "place_center_x, place_center_z",
	})


	minetest.register_decoration({
		name = "ebiomes:blueberry_bushext",
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
		biomes = {"grassland_coldish"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/blueberry_bush.mts",
		flags = "place_center_x, place_center_z",
	})
	

-- Specifics

-- Warmish/Fruity deciduous forest


if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:pear_treeext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.004,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 100,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_fruity"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_pear_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
else
	minetest.register_decoration({
		name = "ebiomes:pear_treeext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.004,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 100,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_fruity"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_pear_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end
	
	minetest.register_decoration({
		name = "ebiomes:pear_logext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_fruity"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_pear_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"default:dirt_with_grass"},
		num_spawn_by = 8,
	})
	
if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:hornbeam_treeext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.005,
			scale = 0.01,
			spread = {x = 250, y = 250, z = 250},
			seed = 106,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_fruity"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hornbeam_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
else	
	minetest.register_decoration({
		name = "ebiomes:hornbeam_treeext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.01,
			scale = 0.01,
			spread = {x = 250, y = 250, z = 250},
			seed = 106,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_fruity"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hornbeam_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end
	
	minetest.register_decoration({
		name = "ebiomes:hornbeam_log",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_fruity"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_hornbeam_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"default:dirt_with_grass"},
		num_spawn_by = 8,
	})
	
	
	-- Coldish/Woody deciduous
	
	-- Aspen

	minetest.register_decoration({
		name = "ebiomes:aspen_treeext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = -0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 104,
			octaves = 3,
			persist = 0.06
		},
		biomes = {"deciduous_forest_woody"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("default") .. "/schematics/aspen_tree.mts",
		flags = "place_center_x, place_center_z",
	})
	
	minetest.register_decoration({
		name = "ebiomes:aspen_logext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_woody"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_aspen_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"default:dirt_with_grass"},
		num_spawn_by = 8,
	})
	
	-- Berries
	
	minetest.register_decoration({
		name = "ebiomes:blackcurrant_bushext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 787,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_blackcurrant_bush.mts",
		flags = "place_center_x, place_center_z",
	})
	
	minetest.register_decoration({
		name = "ebiomes:redcurrant_bushext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 878,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_redcurrant_bush.mts",
		flags = "place_center_x, place_center_z",
	})
	
	
	minetest.register_decoration({
		name = "ebiomes:gooseberry_bushext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 969,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		place_offset_y = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_gooseberry_bush.mts",
		flags = "place_center_x, place_center_z",
	})

if minetest.settings:get_bool("light_mapgen", true) then
	minetest.register_decoration({
		name = "ebiomes:ash_treeext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.01,
			spread = {x = 250, y = 250, z = 250},
			seed = 102,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_ash_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
else	
	minetest.register_decoration({
		name = "ebiomes:ash_treeext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.009,
			scale = 0.01,
			spread = {x = 250, y = 250, z = 250},
			seed = 102,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_ash_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end
	
	minetest.register_decoration({
		name = "ebiomes:ash_logext",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_woody"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_ash_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"default:dirt_with_grass"},
		num_spawn_by = 8,
	})
	
	
	
--[[	
	-- Grassland warmish
	
	minetest.register_decoration({
		name = "ebiomes:larkspurext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.006,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 384,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"grassland_warmish"},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:larkspur",
	})
--]]	
	-- Grassland coldish
	
	minetest.register_decoration({
		name = "ebiomes:russian_irisext",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.008,
			scale = 0.001,
			spread = {x = 100, y = 100, z = 100},
			seed = 350,
			octaves = 3,
			persist = 0.05
		},
		biomes = {"grassland_coldish"},
		y_max = 31000,
		y_min = 1,
		decoration = "ebiomes:russian_iris",
	})
