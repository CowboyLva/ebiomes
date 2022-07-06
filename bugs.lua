local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

minetest.register_decoration({
		name = "ebiomes:butterfly",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold", "default:dirt_with_grass", "ebiomes:dirt_with_grass_warm"},
		place_offset_y = 2,
		sidelen = 80,
		fill_ratio = 0.005,
		biomes = {"mediterranean", "warm_steppe", "steppe", "cold_steppe", "deciduous_forest_humid", "deciduous_forest_warm", "grassland_warm"},
		y_max = 31000,
		y_min = 1,
		decoration = {
			"butterflies:butterfly_white",
			"butterflies:butterfly_red",
			"butterflies:butterfly_violet"
		},
		spawn_by = "group:flower",
		num_spawn_by = 1
	})

-- Fireflies havebeen baked to reregaux.lua
