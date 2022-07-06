--Vanilla mods besides default

if minetest.get_mapgen_setting("mg_name") == "v6" then

	minetest.register_decoration({
		name = "fireflies:firefly_low",
		deco_type = "simple",
		place_on = "default:dirt_with_grass",
		place_offset_y = 2,
		sidelen = 80,
		fill_ratio = 0.0002,
		y_max = 31000,
		y_min = 1,
		decoration = "fireflies:hidden_firefly",
	})

	minetest.register_decoration({
		name = "fireflies:firefly_high",
		deco_type = "simple",
		place_on = "default:dirt_with_grass",
		place_offset_y = 3,
		sidelen = 80,
		fill_ratio = 0.0002,
		y_max = 31000,
		y_min = 1,
		decoration = "fireflies:hidden_firefly",
	})

else
--Some baking done from bugs.lua
	minetest.register_decoration({
		name = "fireflies:firefly_low",
		deco_type = "simple",
		place_on = {
			"default:dirt_with_grass",
			"default:dirt_with_coniferous_litter",
			"default:dirt_with_rainforest_litter",
			"default:dirt",
			"ebiomes:dirt_with_grass_cold",
			"ebiomes:dirt_with_grass_swamp",
			"ebiomes:dirt_with_grass_warm"
		},
		place_offset_y = 2,
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {
			"deciduous_forest",
			"coniferous_forest",
			"rainforest",
			"rainforest_swamp",
			"cold_deciduous",
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
		name = "fireflies:firefly_high",
		deco_type = "simple",
		place_on = {
			"default:dirt_with_grass",
			"default:dirt_with_coniferous_litter",
			"default:dirt_with_rainforest_litter",
			"default:dirt",
			"ebiomes:dirt_with_grass_cold",
			"ebiomes:dirt_with_grass_swamp",
			"ebiomes:dirt_with_grass_warm"
		},
		place_offset_y = 3,
		sidelen = 80,
		fill_ratio = 0.0005,
		biomes = {
			"deciduous_forest",
			"coniferous_forest",
			"rainforest",
			"rainforest_swamp",
			"cold_deciduous",
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
		name = "butterflies:butterfly",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		place_offset_y = 2,
		sidelen = 80,
		fill_ratio = 0.005,
		biomes = {"grassland", "deciduous_forest"},
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

	minetest.register_decoration({
		name = "farming:cotton_wild",
		deco_type = "simple",
		place_on = {"default:dry_dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.1,
			scale = 0.1,
			spread = {x = 50, y = 50, z = 50},
			seed = 4242,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"savanna"},
		y_max = 31000,
		y_min = 1,
		decoration = "farming:cotton_wild",
	})

end

