local S = minetest.get_translator("ebiomes")

--from runs cooltrees
local modname = "ebiomes"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")


--Fireflies
if minetest.get_modpath("fireflies") then
	
	minetest.register_decoration({
		name = "ebiomes:firefly_low",
		deco_type = "simple",
		place_on = {
			"default:dirt",
			"ebiomes:dirt_with_grass_cold",
			"ebiomes:dirt_with_grass_swamp",
			"ebiomes:dirt_with_grass_warm",
			"ebiomes:peat_with_swamp_moss_yellow",
			"ebiomes:peat_wet_with_swamp_moss_green",
			"ebiomes:dirt_with_japanese_rainforest_litter",
			"ebiomes:dirt_with_forest_litter",
			"default:dirt_with_grass"
		},
		place_offset_y = 2,
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {
			"deciduous_forest_cold",
			"swamp",
			"deciduous_forest_warm",
			"bog",
			"japanese_rainforest",
			"temperate_rainforest",
			"deciduous_forest_woody",
			"deciduous_forest_fruity"
		},
		y_max = 31000,
		y_min = -1,
		decoration = "fireflies:hidden_firefly",
	})

	minetest.register_decoration({
		name = "ebiomes:firefly_high",
		deco_type = "simple",
		place_on = {
			"default:dirt",
			"ebiomes:dirt_with_grass_cold",
			"ebiomes:dirt_with_grass_swamp",
			"ebiomes:dirt_with_grass_warm",
			"ebiomes:peat_with_swamp_moss_yellow",
			"ebiomes:peat_wet_with_swamp_moss_green",
			"ebiomes:dirt_with_japanese_rainforest_litter",
			"ebiomes:dirt_with_forest_litter",
			"default:dirt_with_grass"
		},
		place_offset_y = 3,
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {
			"deciduous_forest_cold",
			"swamp",
			"deciduous_forest_warm",
			"bog",
			"japanese_rainforest",
			"temperate_rainforest",
			"deciduous_forest_woody",
			"deciduous_forest_fruity"
		},
		y_max = 31000,
		y_min = -1,
		decoration = "fireflies:hidden_firefly",
	})
		
end


minetest.register_decoration({
		name = "ebiomes:butterfly",
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_grass_swamp", "ebiomes:peat_with_swamp_moss_yellow", "ebiomes:peat_wet_with_swamp_moss_green", "ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dry_dirt_with_humid_savanna_grass", "default:dirt_with_grass"},
		place_offset_y = 2,
		sidelen = 80,
		fill_ratio = 0.005,
		biomes = {"mediterranean", "warm_steppe", "steppe", "cold_steppe", "deciduous_forest_warm", "grassland_warm", "swamp", "bog", "japanese_rainforest", "humid_savanna", "deciduous_forest_woody", "grassland_coldish", "deciduous_forest_fruity"},
		y_max = 31000,
		y_min = 1,
		decoration = {
			"butterflies:butterfly_white",
			"butterflies:butterfly_red",
			"butterflies:butterfly_violet",
		},
		spawn_by = "group:flower",
		num_spawn_by = 1
	})


