-- Wilhelmines Animal World Spawns

mobs:spawn({
	name = "animalworld:ant",
	nodes = {"ebiomes:dirt_with_grass_cold"},
	neighbors = {"animalworld:anthill"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	active_object_count = 7,
	min_height = 0,
	max_height = 50,
        day_toggle = true
})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"ebiomes:dirt_with_grass_cold"},
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		y_max = 50,
		y_min = 0,
		decoration = "animalworld:anthill"
	})

mobs:spawn({
	name = "animalworld:bat",
	nodes = {"ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_grass_arid_cool", "ebiomes:peat_with_swamp_moss_yellow", "ebiomes:wet_peat_with_swamp_moss_green", "ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dry_dirt_with_humid_savanna_grass", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_jungle_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 5,
	min_height = -100,
	max_height = 50,
	day_toggle = false,
})

mobs:spawn({
	name = "animalworld:bear",
	nodes = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_forest_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = -15,
	max_height = 120,

})
	minetest.register_decoration({
		name = "ebiomes:animalworld_beavernest",
		deco_type = "schematic",
		place_on = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_forest_litter"},
		place_offset_y = -2,
    sidelen = 16,
    fill_ratio = 0.00018,
		biomes = {"cold_deciduous", "swamp"},
		y_max = 1,
		y_min = 0,
		schematic = minetest.get_modpath("animalworld") .. "/schematics/animalworld_beavernest.mts",
		flags = "place_center_x",
    flags = "force_placement",
		rotation = "random",
		spawn_by = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_forest_litter"},
		num_spawn_by = 8,
	})

mobs:spawn({
	name = "animalworld:blackbird",
	nodes = {"ebiomes:dirt_with_grass_warm"}, 
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 0,
	max_height = 100,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:blackgrouse",
	nodes = {"ebiomes:dirt_with_grass_cold"}, 
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 5,
	max_height = 60,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:boar",
	nodes = {"ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_forest_litter"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 1,
	max_height = 80,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:camel",
	nodes = {"ebiomes:dry_dirt_with_grass_arid"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 0,
	max_height = 40,
})

mobs:spawn({
	name = "animalworld:cockroach",
	nodes = {"default:dirt_with_rainforest_litter"},
	min_light = 0,
	interval = 30,
	chance = 100, -- 15000
	active_object_count = 3,
	min_height = 5,
	max_height = 31000,
	day_toggle = false,
})

mobs:spawn({
	name = "animalworld:crocodile",
	nodes = {"ebiomes:dry_dirt_with_humid_savanna_grass", "ebiomes:dry_dirt_with_grass_arid", "ebiomes:dirt_with_jungle_savanna_grass"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 0,
	max_height = 3,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:elephant",
	nodes = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 0,
	max_height = 65,
	day_toggle = true,
})


--[[

mobs:spawn({
	name = "animalworld:fox",
        nodes = {"default:permafrost", "default:permafrost_with_moss", "default:permafrost_with_stones"},
	neighbors = {"animalworld:animalworld_tundrashrub1", "animalworld:animalworld_tundrashrub2"},
	min_light = 0,
	interval = 60,
	chance = 2, -- 15000
	active_object_count = 2,
	min_height = 1,
	max_height = 80,
})

--]]


mobs:spawn({
	name = "animalworld:frog",
	nodes = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_jungle_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = -10,
	max_height = 2,
})

mobs:spawn({
	name = "animalworld:giraffe",
	nodes = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 5,
	max_height = 100,
	day_toggle = true,
})

--[[

mobs:spawn({
	name = "animalworld:gnu",
	nodes = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 20,
	max_height = 50,
	day_toggle = true,
})

--]]

--[[

mobs:spawn({
	name = "animalworld:goldenmole",
	nodes = {"default:desert_sand"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 10,
	max_height = 55,

})

--]]


mobs:spawn({
	name = "animalworld:goose",
	nodes = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_forest_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 4,
	min_height = -1,
	max_height = 2,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:hare",
	nodes = {"ebiomes:dirt_with_grass_med", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_warm", "ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_grass_arid_cool", "ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dry_dirt_with_humid_savanna_grass", "ebiomes:dirt_with_forest_litter", "ebiomes:dirt_with_jungle_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 5,
	max_height = 100,
	day_toggle = true,
})

--[[

mobs:spawn({
	name = "animalworld:hermitcrab",
	nodes = {"naturalbiomes:palmbeach_sand"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	active_object_count = 4,
	min_height = 2,
	max_height = 6,
})

--]]


mobs:spawn({
	name = "animalworld:hyena",
	nodes = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 20,
	max_height = 60,
})

mobs:spawn({
	name = "animalworld:hippo",
	nodes = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 0,
	max_height = 5,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:yak",
	nodes = {"ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 50,
	max_height = 200,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:ibex",
	nodes = {"ebiomes:dirt_with_grass_med", "ebiomes:dry_dirt_with_grass_arid"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 30,
	max_height = 31000,
	day_toggle = true,
})
--[[
mobs:spawn({
	name = "animalworld:iguana",
	nodes = {"default:dirt_with_rainforest_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 1,
	max_height = 31000,
	day_toggle = true,
})
--]]
mobs:spawn({
	name = "animalworld:indianrhino",
	nodes = {"ebiomes:dry_dirt_with_humid_savanna_grass", "ebiomes:dirt_with_jungle_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 5,
	max_height = 50,
	day_toggle = true,
})

--[[

mobs:spawn({
	name = "animalworld:kangaroo",
	nodes = {"default:desert_sand", "naturalbiomes:outback_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 5,
	max_height = 45,
	day_toggle = true,
})

--]]

mobs:spawn({
	name = "animalworld:kobra",
	nodes = {"ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_humid_savanna_grass"}, 
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = -30,
	max_height = 10,
})

mobs:spawn({
	name = "animalworld:locust",
	nodes = {"ebiomes:dry_dirt_with_grass_arid"}, 
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 10,
	max_height = 75,
	day_toggle = true,
})

--[[

mobs:spawn({
	name = "animalworld:marmot",
	nodes = {"naturalbiomes:alpine_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 4,
	min_height = 30,
	max_height = 31000,
	day_toggle = true,
})

--]]

--[[

mobs:spawn({
	name = "animalworld:monitor",
	nodes = {"default:desert_sand", "default:desert_sandstone", "naturalbiomes:outback_litter"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 20,
	max_height = 45,
	day_toggle = true,
})

--]]


mobs:spawn({
	name = "animalworld:monkey",
	nodes = {"ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dirt_with_jungle_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 6,
	min_height = 30,
	max_height = 75,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:moose",
	nodes = {"ebiomes:dirt_with_grass_cold"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 0,
	max_height = 120,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:mosquito",
	nodes = {"ebiomes:reeds"},
	neighbors = {"air"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	active_object_count = 2,
	min_height = 0,
	max_height = 50,
        day_toggle = false
})

--[[

mobs:spawn({
	name = "animalworld:owl",
	nodes = {"default:dirt_with_coniferous_litter"}, {"default:pine_needles"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 10,
	max_height = 60,
	day_toggle = false,
})

--]]


mobs:spawn({
	name = "animalworld:scorpion",
	nodes = {"ebiomes:dry_dirt_with_grass_arid"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = -20,
	max_height = 50,
	day_toggle = false,
})

mobs:spawn({
	name = "animalworld:snail",
	nodes = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_warm", "ebiomes:dirt_with_forest_litter"},
	neighbors = {"farming:cucumber", "farming:cabbage_6", "farming:lettuce_5", "farming:beetroot_5", "flowers:dandelion_yellow"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	active_object_count = 3,
	min_height = 6,
	max_height = 40,
})

mobs:spawn({
	name = "animalworld:snowleopard",
	nodes = {"ebiomes:dirt_with_steppe_grass_cold"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 60,
	max_height = 300,

})

--[[

mobs:spawn({
	name = "animalworld:spider",
	nodes = {"default:stone", "default:desert_stone", "default:sandstone"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = -30,
	max_height = 1,
})

--]]

mobs:spawn({
	name = "animalworld:spidermale",
	nodes = {"ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_humid_savanna_grass", "ebiomes:dirt_with_jungle_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = -10,
	max_height = 20,
	day_toggle = false,
})

--[[

mobs:spawn({
	name = "animalworld:stingray",
	nodes = {"default:water_source", "default:river_water_source"},
	neighbors = {"naturalbiomes:palmbeach_sand"},
	min_light = 0,
	interval = 60,
	active_object_count = 2,
	chance = 8000, -- 15000
	min_height = 0,
	max_height = 5,
})

--]]

mobs:spawn({
	name = "animalworld:tapir",
	nodes = {"default:dirt_with_rainforest_litter", "ebiomes:dirt_with_jungle_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 1,
	max_height = 31000,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:termite",
	nodes = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
	neighbors = {"animalworld:termitemould"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	active_object_count = 7,
	min_height = 0,
	max_height = 50,
})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"ebiomes:dry_dirt_with_huid_savanna_grass"},
	        neighbors = {"ebiomes:jaragua_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		y_max = 50,
		y_min = 0,
		decoration = "animalworld:termitemould"
	})
	
mobs:spawn({
	name = "animalworld:tiger",
	nodes = {"ebiomes:dirt_with_grass_steppe"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 10,
	max_height = 50,

})

mobs:spawn({
	name = "animalworld:tortoise",
	nodes = {"ebiomes:dirt_with_grass_med"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 5,
	max_height = 70,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:viper",
	nodes = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_forest_litter"}, 
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 0,
	max_height = 50,
	day_toggle = true,
})

mobs:spawn({
	name = "animalworld:volverine",
	nodes = {"ebiomes:dirt_with_steppe_grass_cold"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 20,
	max_height = 60,
	day_toggle = false,

})

mobs:spawn({
	name = "animalworld:vulture",
	nodes = {"ebiomes:dirt_with_grass_med", "ebiomes:dry_dirt_with_grass_arid", "ebiomes:dry_dirt_with_humid_savanna_grass", "ebiomes:dirt_with_grass_steppe"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 50,
	max_height = 300,
	day_toggle = true,
})

--[[

mobs:spawn({
	name = "animalworld:wasp",
	nodes = {"animalworld:waspnest"},
	neighbors = {"air"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	active_object_count = 7,
	min_height = 0,
	max_height = 50,
        day_toggle = true
})

--]]

--[[
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:aspen_leaves"},
	        neighbors = {"animalworld:waspnest"},
		sidelen = 16,
		noise_params = {
			offset = 1,
			scale = 1,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		y_max = 75,
		y_min = 0,
		decoration = "animalworld:waspnest"
	})
--]]


mobs:spawn({
	name = "animalworld:wolf",
	nodes = {"ebiomes:dirt_with_grass_cold", "ebiomes:dirt_with_grass_swamp", "ebiomes:dirt_with_grass_steppe_warm", "ebiomes:dirt_with_grass_steppe", "ebiomes:dirt_with_grass_steppe_cold", "ebiomes:dirt_with_japanese_rainforest_litter", "ebiomes:dirt_with_forest_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 4,
	min_height = 30,
	max_height = 31000,
	day_toggle = false,
})

mobs:spawn({
	name = "animalworld:zebra",
	nodes = {"ebiomes:dry_dirt_with_humid_savanna_grass"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 6,
	max_height = 50,
	day_toggle = true,
})


