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
			"ebiomes:dirt_with_grass_warm"
		},
		place_offset_y = 2,
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {
			"deciduous_forest_cold",
			"swamp",
			"deciduous_forest_humid",
			"rainforest_humid",
			"rainforest_humid_swamp",
			"deciduous_forest_warm"
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
			"ebiomes:dirt_with_grass_warm"
		},
		place_offset_y = 3,
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {
			"deciduous_forest_cold",
			"swamp",
			"deciduous_forest_humid",
			"rainforest_humid",
			"rainforest_humid_swamp",
			"deciduous_forest_warm"
		},
		y_max = 31000,
		y_min = -1,
		decoration = "fireflies:hidden_firefly",
	})
		
end


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


