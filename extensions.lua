local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")


--Aliases

minetest.register_alias("oak_tree", "ebiomes:oak_tree")
minetest.register_alias("oak_wood", "ebiomes:oak_wood")
minetest.register_alias("oak_leaves", "ebiomes:oak_leaves")
minetest.register_alias("oak_sapling", "ebiomes:oak_sapling")
minetest.register_alias("acorns", "ebiomes:acorns")
minetest.register_alias("bucket_acorns", "ebiomes:bucket_acorns")
minetest.register_alias("acorns_cooked", "ebiomes:acorns_cooked")

minetest.register_alias("maple_tree", "ebiomes:maple_tree")
minetest.register_alias("maple_wood", "ebiomes:maple_wood")
minetest.register_alias("maple_leaves", "ebiomes:maple_leaves")
minetest.register_alias("maple_sapling", "ebiomes:maple_sapling")


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
		y_min = -400,
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
		y_min = -400,
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
		y_min = -400,
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




--Trees

--Oak

	minetest.register_node("ebiomes:oak_tree", {
		description = S("Oak Tree"),
		tiles = {"ebiomes_oak_tree_top.png", "ebiomes_oak_tree_top.png",
			"ebiomes_oak_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:oak_wood", {
		description = S("Oak Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_oak_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:oak_wood 4",
		recipe = {
			{"ebiomes:oak_tree"},
		}
	})

	minetest.register_node("ebiomes:oak_leaves", {
		description = S("Oak Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_oak_leaves.png"},
--		special_tiles = {"ebiomes_oak_leaves_simple.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:oak_sapling"}, rarity = 20},
				{items = {"ebiomes:oak_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:oak_tree"},
		leaves = {"ebiomes:oak_leaves"},
		radius = 3,
	})

local function grow_new_oak_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-5, y = pos.y, z = pos.z-5}, modpath.."/schematics/ebiomes_oak_tree.mts", "0", nil, false)
end

	minetest.register_node("ebiomes:oak_sapling", {
		description = S("Oak Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_oak_sapling.png"},
		inventory_image = "ebiomes_oak_sapling.png",
		wield_image = "ebiomes_oak_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_oak_tree,
		selection_box = {
			type = "fixed",
			fixed = {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 3,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"ebiomes:oak_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -6, y = 1, z = -6},
				{x = 6, y = 10, z = 6},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:oak_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.0001,
			scale = 0.003,
			spread = {x = 250, y = 250, z = 250},
			seed = 813,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold", "deciduous_forest", "deciduous_forest_warm", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_oak_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:oak_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_cold", "deciduous_forest", "deciduous_forest_warm", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_oak_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold"},
		num_spawn_by = 8,
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:oak_sapling", grow_new_oak_tree, "soil"},
})
end

	stairs.register_stair_and_slab("oak_wood", "ebiomes:oak_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_oak_wood.png"},
		S("Oak Wood Stair"),
		S("Oak Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Oak Wood Stair"),
		S("Outer Oak Wood Stair")
	)

	default.register_fence("ebiomes:fence_oak_wood", {
		description = S("Oak Wood Fence"),
		texture = "ebiomes_fence_oak_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_oak_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_oak_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:oak_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_oak_wood", {
		description = S("Oak Wood Fence Rail"),
		texture = "ebiomes_fence_rail_oak_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_oak_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_oak_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:oak_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_oak_wood", {
		description = S("Oak Wood Mese Post Light"),
		texture = "ebiomes_fence_oak_wood.png",
		material = "ebiomes:oak_wood",
	})

	doors.register_fencegate("ebiomes:gate_oak_wood", {
		description = S("Oak Wood Fence Gate"),
		texture = "ebiomes_oak_wood.png",
		material = "ebiomes:oak_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_oak_wood_closed",
		burntime = 9,
	})


-- Acorns

	minetest.register_node("ebiomes:acorns", {
		description = S("Acorns"),
		drawtype = "plantlike",
		tiles = {"ebiomes_acorns_hanging.png"},
		inventory_image = "ebiomes_acorns.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, 8 / 16, -6 / 16, 6 / 16, 2 /16, 6 / 16}
		},
		groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
			leafdecay = 3, leafdecay_drop = 1, food_apple = 1},
--		on_use = minetest.item_eat(2),
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = function(pos, placer, itemstack)
			minetest.set_node(pos, {name = "ebiomes:acorns", param2 = 1})
		end,

		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			if oldnode.param2 == 0 then
				minetest.set_node(pos, {name = "ebiomes:acorns_mark"})
				minetest.get_node_timer(pos):start(math.random(300, 1500))
			end
		end,
	})

	minetest.register_node("ebiomes:acorns_mark", {
		description = S("Acorns Marker"),
		inventory_image = "ebiomes_acorns.png^default_invisible_node_overlay.png",
		wield_image = "ebiomes_acorns.png^default_invisible_node_overlay.png",
		drawtype = "airlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		drop = "",
		groups = {not_in_creative_inventory = 1},
		on_timer = function(pos, elapsed)
			if not minetest.find_node_near(pos, 1, "ebiomes:acorns_leaves") then
				minetest.remove_node(pos)
			elseif minetest.get_node_light(pos) < 11 then
				minetest.get_node_timer(pos):start(200)
			else
				minetest.set_node(pos, {name = "ebiomes:acorns"})
			end
		end
	})

	minetest.register_craftitem("ebiomes:acorns_cooked", {
		description = S("Cooked Acorns"),
		inventory_image = "ebiomes_acorns_cooked.png",
		groups = {food_acorns = 1, eatable = 4},
		on_use = minetest.item_eat(4),
	})


	minetest.register_craftitem("ebiomes:bucket_acorns", {
		description = S("Bucket of Acorns"),
		inventory_image = "ebiomes_bucket_acorns.png",
		groups = {cookables_acorns = 1},
	})

	minetest.register_craft({
		output = "ebiomes:bucket_acorns",
		recipe = {
            {"ebiomes:acorns"},
			{"bucket:bucket_water"},
		}
	})

	minetest.register_craft({
		output = "ebiomes:bucket_acorns",
		recipe = {
            {"ebiomes:acorns"},
			{"bucket:bucket_river_water"},
		}
	})

    minetest.register_craft({
		output = "ebiomes:oak_sapling",
		recipe = {
			{"ebiomes:acorns"},
		}
	})

    minetest.register_craft({
		type = "cooking",
		output = "ebiomes:acorns_cooked",
		recipe = "ebiomes:bucket_acorns",
		replacements = {{"ebiomes:bucket_acorns", "bucket:bucket_empty"}},
		cooktime = 3,
	})




--Peripheral mod support


--Moreblocks

--sampled from cool_trees
-- stairsplus/moreblocks
if minetest.get_modpath("moreblocks") then


	stairsplus:register_all("oak_tree", "wood", "ebiomes:oak_wood", {
		description = "Oak Wood",
		tiles = {"ebiomes_oak_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:oak_sapling")

end










--Maple

	minetest.register_node("ebiomes:maple_tree", {
		description = S("Maple Tree"),
		tiles = {"ebiomes_maple_tree_top.png", "ebiomes_maple_tree_top.png",
			"ebiomes_maple_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("ebiomes:maple_wood", {
		description = S("Maple Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"ebiomes_maple_wood.png"},
		is_ground_content = false,
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_craft({
		output = "ebiomes:maple_wood 4",
		recipe = {
			{"ebiomes:maple_tree"},
		}
	})

	minetest.register_node("ebiomes:maple_leaves", {
		description = S("Maple Tree Leaves"),
		drawtype = "allfaces_optional",
		tiles = {"ebiomes_maple_leaves.png"},
		waving = 1,
		paramtype = "light",
		is_ground_content = false,
		walkable = true,
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		drop = {
			max_items = 1,
			items = {
				{items = {"ebiomes:maple_sapling"}, rarity = 20},
				{items = {"ebiomes:maple_leaves"}}
			}
		},
		sounds = default.node_sound_leaves_defaults(),

		after_place_node = default.after_place_leaves,
	})

	default.register_leafdecay({
		trunks = {"ebiomes:maple_tree"},
		leaves = {"ebiomes:maple_leaves"},
		radius = 3,
	})

--left this credit but erased it's identicals further down the line
--borrowed from runs cooltrees modpack (baldcypress)
--[[
local function grow_new_baldcypress_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(240, 600))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-4, y = pos.y, z = pos.z-4}, modpath.."/schematics/baldcypress.mts", "0", nil, false)
end
--]]

local function grow_new_maple_tree(pos)
	if not default.can_grow(pos) then
		-- try a bit later again
		minetest.get_node_timer(pos):start(math.random(150, 300))
		return
	end
	minetest.remove_node(pos)
	minetest.place_schematic({x = pos.x-3, y = pos.y, z = pos.z-3}, modpath.."/schematics/ebiomes_maple_tree.mts", "0", nil, false)
end

--schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_maple.mts"

	minetest.register_node("ebiomes:maple_sapling", {
		description = S("Maple Tree Sapling"),
		drawtype = "plantlike",
		tiles = {"ebiomes_maple_sapling.png"},
		inventory_image = "ebiomes_maple_sapling.png",
		wield_image = "ebiomes_maple_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_new_maple_tree,
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
				"ebiomes:maple_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -3},
				{x = 3, y = 11, z = 3},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_decoration({
		name = "ebiomes:maple_tree",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		sidelen = 16,
		noise_params = {
			offset = 0.001,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 162,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest_cold", "deciduous_forest", "deciduous_forest_warm", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_maple_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "ebiomes:maple_log",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		place_offset_y = 1,
		sidelen = 80,
		fill_ratio = 0.0009,
		biomes = {"deciduous_forest_cold", "deciduous_forest", "deciduous_forest_warm", "deciduous_forest_fruity", "deciduous_forest_woody"},
		y_max = 31000,
		y_min = 4,
		schematic = minetest.get_modpath("ebiomes") .. "/schematics/ebiomes_maple_log.mts",
		flags = "place_center_x",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		num_spawn_by = 8,
	})

if minetest.get_modpath("bonemeal") ~= nil then
bonemeal:add_sapling({
	{"ebiomes:maple_sapling", grow_new_maple_tree, "soil"},
})
end

	--forms sampled from pigiron mod
	stairs.register_stair_and_slab("maple_wood", "ebiomes:maple_wood",
		{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		{"ebiomes_maple_wood.png"},
		S("Maple Wood Stair"),
		S("Maple Wood Slab"),
		default.node_sound_wood_defaults(),
		true,
		S("Inner Maple Wood Stair"),
		S("Outer Maple Wood Stair")
	)

	default.register_fence("ebiomes:fence_maple_wood", {
		description = S("Maple Wood Fence"),
		texture = "ebiomes_fence_maple_wood.png",
		inventory_image = "default_fence_overlay.png^ebiomes_fence_maple_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_overlay.png^ebiomes_fence_maple_wood.png^" ..
					"default_fence_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:maple_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_fence_rail("ebiomes:fence_rail_maple_wood", {
		description = S("Maple Wood Fence Rail"),
		texture = "ebiomes_fence_rail_maple_wood.png",
		inventory_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_maple_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		wield_image = "default_fence_rail_overlay.png^ebiomes_fence_rail_maple_wood.png^" ..
					"default_fence_rail_overlay.png^[makealpha:255,126,126",
		material = "ebiomes:maple_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
		sounds = default.node_sound_wood_defaults()
	})

	default.register_mesepost("ebiomes:mese_post_light_maple_wood", {
		description = S("Maple Wood Mese Post Light"),
		texture = "ebiomes_fence_maple_wood.png",
		material = "ebiomes:maple_wood",
	})

	doors.register_fencegate("ebiomes:gate_maple_wood", {
		description = S("Maple Wood Fence Gate"),
		texture = "ebiomes_maple_wood.png",
		material = "ebiomes:maple_wood",
		groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "ebiomes:gate_maple_wood_closed",
		burntime = 9,
	})



--Peripheral mod support


--Moreblocks

--sampled from cool_trees
-- stairsplus/moreblocks
if minetest.get_modpath("moreblocks") then


	stairsplus:register_all("maple_tree", "wood", "ebiomes:maple_wood", {
		description = "Maple Wood",
		tiles = {"ebiomes_maple_wood.png"},
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})

end

-- Support for flowerpot
if minetest.global_exists("flowerpot") then

	flowerpot.register_node("ebiomes:maple_sapling")

end
